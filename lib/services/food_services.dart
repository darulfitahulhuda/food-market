part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'food';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode);
      return ApiReturnValue(message: 'Please Try Again');
    }

    var data = jsonDecode(response.body);
    List<Food> foods = (data['data']['data'] as Iterable)
        .map((e) => Food.fromJson(e))
        .toList();

    return ApiReturnValue(value: foods);
  }
}
