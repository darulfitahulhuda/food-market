part of 'models.dart';

enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  Food({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.types = const [],
  });

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data['id'],
      picturePath: data['picturePath'],
      name: data['name'],
      description: data['description'],
      ingredients: data['ingredients'],
      price: data['price'],
      rate: (data['rate'] as num).toDouble(),
      types: data['types'].toString().split(',').map((e) {
        switch (e) {
          case 'recommended':
            return FoodType.recommended;
            break;
          case 'Popular':
            return FoodType.popular;
            break;
          default:
            return FoodType.new_food;
        }
      }).toList());

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate, types];
}

List<Food> mockFoods = [
  Food(
    id: 1,
    picturePath:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Sate_Ponorogo.jpg/220px-Sate_Ponorogo.jpg",
    name: "Sate",
    description:
        "Sate adalah .... 123l p12 p[k12 p[k12pk 1[p2k [1k2 [kp12[k p[12k p[k12 pk1 p[1p[2k3p[1k2 p[k12[p3k [12k [12k [12k3 [k12p[3k p12[k3[ 12[k3 123y g1uy2g3 u1g2y y1g3yu g1uy2g3yu1g3y12 gyg3y u1g 3yg211y3 1g3 yu1g23 yg12g 3u12gyug3y12g3 yu1g2 y21g3y1g23yug1y23gy12ug3uyg12uyg3uy12g3yu1g3yu1g uyg1y gy3g1 y3gy1u2g 3u12g3 y1u2y3 gy1ug3 yu123g u1g23g yu1g3 yug12y 3guy1",
    price: 150000,
    ingredients: "Daging Ayam",
    rate: 4.4,
    types: [FoodType.new_food, FoodType.popular, FoodType.recommended],
  ),
  Food(
    id: 6,
    picturePath:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Sate_Ponorogo.jpg/220px-Sate_Ponorogo.jpg",
    name: "Sate 6",
    description:
        "Sate adalah .... 123l p12 p[k12 p[k12pk 1[p2k [1k2 [kp12[k p[12k p[k12 pk1 p[1p[2k3p[1k2 p[k12[p3k [12k [12k [12k3 [k12p[3k p12[k3[ 12[k3 123y g1uy2g3 u1g2y y1g3yu g1uy2g3yu1g3y12 gyg3y u1g 3yg211y3 1g3 yu1g23 yg12g 3u12gyug3y12g3 yu1g2 y21g3y1g23yug1y23gy12ug3uyg12uyg3uy12g3yu1g3yu1g uyg1y gy3g1 y3gy1u2g 3u12g3 y1u2y3 gy1ug3 yu123g u1g23g yu1g3 yug12y 3guy1",
    price: 150000,
    ingredients: "Daging Ayam",
    rate: 4.4,
    types: [FoodType.new_food, FoodType.popular, FoodType.recommended],
  ),
  Food(
      id: 2,
      picturePath:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Sate_Ponorogo.jpg/220px-Sate_Ponorogo.jpg",
      name: "Ayam Geprek",
      description: "Ayam Geprek ....",
      price: 150000,
      ingredients: "Daging Ayam, bawang putih",
      rate: 4.4,
      types: [FoodType.new_food]),
  Food(
      id: 3,
      picturePath:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Sate_Ponorogo.jpg/220px-Sate_Ponorogo.jpg",
      name: "Ketoprak",
      description: "Ayam Geprek ....",
      price: 150000,
      ingredients: "Daging Ayam, bawang putih",
      rate: 4.4,
      types: [FoodType.popular]),
  Food(
      id: 4,
      picturePath:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Sate_Ponorogo.jpg/220px-Sate_Ponorogo.jpg",
      name: "Kasdcasas ",
      description: "dasd asdsadask ....",
      price: 150000,
      ingredients: "Dagasdas",
      rate: 4.4,
      types: [FoodType.new_food]),
  Food(
      id: 5,
      picturePath:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Sate_Ponorogo.jpg/220px-Sate_Ponorogo.jpg",
      name: "Kasdcasas ",
      description: "1.",
      price: 100000,
      ingredients: "1",
      rate: 4.4,
      types: [FoodType.new_food]),
];
