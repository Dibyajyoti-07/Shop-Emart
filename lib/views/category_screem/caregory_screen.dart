import 'package:get/get.dart';
import 'package:shop_emart/Common%20Wdgets/bg_widget.dart';
import 'package:shop_emart/Controller/product_controller.dart';
import 'package:shop_emart/consts/consts.dart';
import 'package:shop_emart/consts/lists.dart';
import 'package:shop_emart/views/category_screem/category_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      categoriesImages[index],
                      height: 120,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    categoriesList[index]
                        .text
                        .color(Colors.black)
                        .fontFamily(semibold)
                        .align(TextAlign.center)
                        .make(),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .clip(Clip.antiAlias)
                    .outerShadowSm
                    .make()
                    .onTap(() {
                  controller.getSubCategories(categoriesList[index]);
                  Get.to(() => CategoryDetails(
                        title: categoriesList[index],
                      ));
                });
              }),
        ),
      ),
    );
  }
}
