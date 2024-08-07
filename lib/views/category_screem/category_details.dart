import 'package:get/get.dart';
import 'package:shop_emart/Common%20Wdgets/bg_widget.dart';
import 'package:shop_emart/Controller/product_controller.dart';
import 'package:shop_emart/consts/consts.dart';
import 'package:shop_emart/views/category_screem/item_details.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    controller.subcat.length,
                    (index) => "${controller.subcat[index]}"
                        .text
                        .fontFamily(bold)
                        .size(18)
                        .color(Colors.black)
                        .makeCentered()
                        .box
                        .size(100, 40)
                        .color(Colors.white)
                        .roundedSM
                        .padding(const EdgeInsets.all(6))
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),
            20.heightBox,
            Expanded(
                child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 300),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imgP5,
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    "Price - ".text.black.fontFamily(semibold).make(),
                    "3500 - 10%".text.black.fontFamily(bold).make(),
                    "= 3150 Rs".text.black.fontFamily(bold).make(),
                  ],
                )
                    .box
                    .white
                    .padding(const EdgeInsets.all(10))
                    .margin(const EdgeInsets.all(8))
                    .rounded
                    .shadowSm
                    .make()
                    .onTap(() {
                  Get.to(() => const ItemDetails(
                        title: "Dummy Item",
                      ));
                });
              },
            ))
          ],
        ),
      ),
    ));
  }
}
