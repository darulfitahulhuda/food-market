part of 'models.dart';

enum TransactionStatus { delivery, on_delivery, pendig, cancelled }

class Transaction extends Equatable {
  final int id;
  final Food food;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;
  final User user;
  final String paymentUrl;

  Transaction(
      {this.id,
      this.food,
      this.quantity,
      this.total,
      this.dateTime,
      this.status,
      this.user,
      this.paymentUrl});

  factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
      id: data['id'],
      food: Food.fromJson(data['food']),
      quantity: data['quantity'],
      total: data['total'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      status: (data['status'] == 'PENDING')
          ? TransactionStatus.pendig
          : (data['status'] == 'DELIVERED')
              ? TransactionStatus.delivery
              : (data['status'] == 'CANCELLED')
                  ? TransactionStatus.cancelled
                  : TransactionStatus.on_delivery,
      paymentUrl: data['payment_url']);

  Transaction copyWith(
      {int id,
      Food food,
      int quantity,
      int total,
      DateTime dateTime,
      TransactionStatus status,
      User user}) {
    return Transaction(
        id: id ?? this.id,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user);
  }

  // Transaction copyWith(
  //     {int id,
  //     Food food,
  //     int quantity,
  //     int total,
  //     DateTime dateTime,
  //     TransactionStatus status,
  //     User user}) {
  //   return Transaction(
  //       id: id ?? this.id,
  //       food: food ?? this.food,
  //       quantity: quantity ?? this.quantity,
  //       total: total ?? this.total,
  //       dateTime: dateTime ?? this.dateTime,
  //       status: status ?? this.status,
  //       user: user ?? this.status);
  // }

  @override
  List<Object> get props => [id, food, quantity, total, dateTime, status, user];
}

List<Transaction> mockTransaction = [
  Transaction(
    id: 1,
    food: mockFoods[1],
    quantity: 10,
    total: (mockFoods[1].price * 10 * 1.1).round() + 10000,
    dateTime: DateTime.now(),
    status: TransactionStatus.on_delivery,
    user: mockUser,
  ),
  Transaction(
    id: 2,
    food: mockFoods[2],
    quantity: 7,
    total: (mockFoods[2].price * 7 * 1.1).round() + 10000,
    dateTime: DateTime.now(),
    status: TransactionStatus.delivery,
    user: mockUser,
  ),
  Transaction(
    id: 3,
    food: mockFoods[3],
    quantity: 5,
    total: (mockFoods[3].price * 5 * 1.1).round() + 10000,
    dateTime: DateTime.now(),
    status: TransactionStatus.cancelled,
    user: mockUser,
  ),
];
