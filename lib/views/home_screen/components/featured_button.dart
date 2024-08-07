import 'package:shop_emart/consts/consts.dart';

Widget featuredButton({required String title, icon}) {
  return Row(
    children: [
      Image.asset(
        icon,
        height: 70,
        width: 90,
        fit: BoxFit.fill,
      ).box.roundedLg.make(),
      10.widthBox,
      title.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .width(240)
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(const EdgeInsets.all(8))
      .roundedSM
      .outerShadowSm
      .make();
}
