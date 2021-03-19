part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  OrderListItem({@required this.transaction, @required this.itemWidth});

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
                  fit: BoxFit.cover,
                  image: NetworkImage(transaction.food.picturePath))),
        ),
        SizedBox(
          width: itemWidth - 182, // (60 + 60 + 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                "${transaction.quantity} item(s) . " +
                    NumberFormat.currency(
                            locale: 'id-ID', symbol: 'IDR ', decimalDigits: 00)
                        .format(transaction.total),
                style: greyFontStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
        Container(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                converDateTime(transaction.dateTime),
                style: greyFontStyle.copyWith(fontSize: 12),
              ),
              (transaction.status == TransactionStatus.on_delivery)
                  ? Text("On Delvery",
                      style: GoogleFonts.poppins(
                          fontSize: 10, color: "1ABC9C".toColor()))
                  : (transaction.status == TransactionStatus.cancelled)
                      ? Text("Cancelled",
                          style: GoogleFonts.poppins(
                              fontSize: 10, color: "D9435E".toColor()))
                      : (transaction.status == TransactionStatus.pendig)
                          ? Text("Pending",
                              style: GoogleFonts.poppins(
                                  fontSize: 10, color: "D9435E".toColor()))
                          : SizedBox()
            ],
          ),
        )
      ],
    );
  }

  String converDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = "Jan";
        break;
      case 2:
        month = "Feb";
        break;
      case 3:
        month = "Mar";
        break;
      case 4:
        month = "Apr";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "Jun";
        break;
      case 7:
        month = "Jul";
        break;
      case 8:
        month = "Aug";
        break;
      case 9:
        month = "Sep";
        break;
      case 10:
        month = "Oct";
        break;
      case 11:
        month = "Nov";
        break;
      default:
        month = "Dec";
    }
    return month + " ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}";
  }
}
