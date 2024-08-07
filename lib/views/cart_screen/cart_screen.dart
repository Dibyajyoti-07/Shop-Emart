import 'package:shop_emart/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: "Cart is empty"
          .text
          .color(darkFontGrey)
          .fontFamily(semibold)
          .size(18)
          .makeCentered(),
    );
  }
}
