part of 'services.dart';

class TransactionServcies {
  static Future<ApiReturnValue<List<Transaction>>> getTransaction(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'transaction?limit=1000';

    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${User.token}"
      },
    );

    if (response.statusCode != 200) {
      print(response.statusCode);
      return ApiReturnValue(message: 'Please Try Again');
    }

    var data = jsonDecode(response.body);

    List<Transaction> transaction = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: transaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'checkout';

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
        body: jsonEncode(<String, dynamic>{
          "food_id": transaction.food.id,
          "user_id": transaction.user.id,
          "quantity": transaction.quantity,
          "total": transaction.total,
          "status": "PENDING"
        }));

    if (response.statusCode != 200) {
      print(response.statusCode);
      return ApiReturnValue(message: 'Please Try Again');
    }

    var data = jsonDecode(response.body);

    Transaction value = Transaction.fromJson(data['data']);
    return ApiReturnValue(value: value);
  }
}
