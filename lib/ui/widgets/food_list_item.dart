part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double itemWidth;

  FoodListItem({@required this.food, @required this.itemWidth});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(food.picturePath))),
        ),
        SizedBox(
          width: itemWidth - 182, // (60 + 60 + 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                NumberFormat.currency(
                        locale: 'id-ID', symbol: 'IDR ', decimalDigits: 00)
                    .format(food.price),
                style: greyFontStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
        RatingStars(food.rate),
      ],
    );
  }
}
