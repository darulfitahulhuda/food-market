part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'login';
    // String url = "http://food-market.test/api/login";

    var response = await client.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      print(response.statusCode);
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File pictureFile, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'register';

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'password': password,
          'password_confirmation': password,
          'address': user.address,
          'city': user.city,
          'houseNumber': user.houseNumber,
          'phoneNumber': user.phoneNumber
        }));

    print(response.body);
    print(response.contentLength);
    print(response.statusCode);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again user services");
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(
            picturePath:
                "http://foodmarket-backend.buildwithangga.id/storage/" +
                    result.value);
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest request}) async {
    String url = baseUrl + 'user/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("Post", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${User.token}";
    }

    var multiPartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multiPartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: "Uploading Profile Picture Failed");
    }
  }

  static Future<ApiReturnValue<bool>> signOut({http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'logout';

    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${User.token}"
      },
    );
    if (response.statusCode != 200) {
      print(response.statusCode);
      return ApiReturnValue(message: 'Logout Gagal');
    }
    var data = jsonDecode(response.body);

    bool det = data['data'];
    print(response.statusCode);
    return ApiReturnValue(value: det);
  }
}
