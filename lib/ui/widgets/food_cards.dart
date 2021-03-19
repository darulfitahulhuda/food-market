part of 'widgets.dart';

class FoodCards extends StatelessWidget {
  final Food food;
  FoodCards(this.food);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 15, spreadRadius: 3, color: Colors.black12),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                    image: NetworkImage(food.picturePath), fit: BoxFit.cover)),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.fromLTRB(12, 12, 12, 6),
            child: Text(
              food.name,
              style: blackFontStyle2,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: RatingStars(food.rate),
          ),
        ],
      ),
    );
  }
}
