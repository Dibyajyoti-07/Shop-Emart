import 'package:shop_emart/consts/consts.dart';

Widget DetailsCard({width, required String count, required String title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      count.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      1.heightBox,
      title.text.size(14).color(darkFontGrey).fontFamily(semibold).make(),
    ],
  )
      .box
      .white
      .rounded
      .width(width)
      .height(70)
      .padding(const EdgeInsets.all(8))
      .make();
}
