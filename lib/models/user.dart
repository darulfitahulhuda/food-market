part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;
  static String token;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        address: data['address'],
        houseNumber: data['houseNumber'],
        phoneNumber: data['phoneNumber'],
        city: data['city'],
        picturePath: data['profile_photo_url'],
      );

  User copyWith(
          {int id,
          String name,
          String email,
          String address,
          String houseNumber,
          String phoneNumber,
          String city,
          String picturePath}) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          address: address ?? this.address,
          houseNumber: houseNumber ?? this.houseNumber,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          city: city ?? this.city,
          picturePath: picturePath ?? this.picturePath);

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = User(
  id: 1,
  name: "DNC",
  address: "Kp. Kosong",
  city: "Surabaya",
  houseNumber: "123",
  phoneNumber: "088808974665",
  picturePath:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXzZntnOdSZq5YrGXUEvLscvByILU3_DK0FQ&usqp=CAU.png",
  email: "dnc@gmail.com",
);
