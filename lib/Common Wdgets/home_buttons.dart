import 'package:shop_emart/consts/consts.dart';

Widget HomeButtons({width, height, icon, required String title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      10.heightBox,
      title.text.fontFamily(bold).color(Colors.black).make(),
    ],
  ).box.roundedLg.white.size(width, height).make();
}
