import 'package:shop_emart/consts/consts.dart';

Widget applogoWidget() {
  //using Velocity_X here;
  return Image.asset(
    icAppLogo,
    color: Colors.white,
  )
      .box
      .transparent
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
