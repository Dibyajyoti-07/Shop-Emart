import 'package:shop_emart/Common%20Wdgets/our_button.dart';
import 'package:shop_emart/consts/consts.dart';
import 'package:shop_emart/consts/lists.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(Colors.white).make(),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outlined)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  20.heightBox,
                  title!.text
                      .size(22)
                      .fontFamily(bold)
                      .color(Colors.black)
                      .make(),
                  10.heightBox,
                  VxRating(
                    onRatingUpdate: (Value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "1500 RS"
                      .text
                      .color(Colors.black)
                      .fontFamily(bold)
                      .size(18)
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller"
                                .text
                                .color(Colors.black)
                                .size(20)
                                .fontFamily(bold)
                                .make(),
                            5.heightBox,
                            "In House Brands"
                                .text
                                .size(16)
                                .fontFamily(semibold)
                                .color(Colors.grey.shade700)
                                .make()
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.message_rounded,
                          color: whiteColor,
                        ),
                      )
                    ],
                  )
                      .box
                      .height(80)
                      .color(textfieldGrey)
                      .padding(const EdgeInsets.all(10))
                      .rounded
                      .make(),
                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color"
                                .text
                                .color(textfieldGrey)
                                .size(20)
                                .fontFamily(semibold)
                                .make(),
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .color(Vx.randomPrimaryColor)
                                  .roundedFull
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .make(),
                            ),
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity"
                                .text
                                .color(textfieldGrey)
                                .size(20)
                                .fontFamily(semibold)
                                .make(),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove)),
                              "0"
                                  .text
                                  .color(darkFontGrey)
                                  .fontFamily(bold)
                                  .size(20)
                                  .make(),
                              10.widthBox,
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                              "(0 available)"
                                  .text
                                  .color(Colors.grey.shade600)
                                  .size(16)
                                  .fontFamily(semibold)
                                  .make(),
                            ],
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total"
                                .text
                                .color(textfieldGrey)
                                .size(20)
                                .fontFamily(semibold)
                                .make(),
                          ),
                          "0.00 Rs."
                              .text
                              .color(Colors.black)
                              .size(20)
                              .fontFamily(bold)
                              .make()
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.shadowSm.make(),
                  10.heightBox,
                  "Description"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  "This is a Product by fanatic company. And such Products are approved by Govt. of India"
                      .text
                      .color(darkFontGrey)
                      .make(),
                  10.heightBox,
                  SizedBox(
                    height: 300,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          itemDetailsButtonList.length,
                          (index) => ListTile(
                                title: itemDetailsButtonList[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: const Icon(Icons.arrow_forward),
                              )),
                    ),
                  ),
                  20.heightBox,
                  productyoumaylike.text
                      .fontFamily(bold)
                      .size(16)
                      .color(darkFontGrey)
                      .make(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Image.asset(
                                    imgP1,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  10.heightBox,
                                  "HP Laptop - 8gb ram, 512gb Gen4 SSD, Ryzen 5 7353HS Nvidia GTX1650 4gb, 144Hz Refreshrate, 15.6inch display"
                                      .text
                                      .fontFamily(semibold)
                                      .white
                                      .make(),
                                  10.heightBox,
                                  "Price - "
                                      .text
                                      .white
                                      .fontFamily(semibold)
                                      .make(),
                                  5.heightBox,
                                  "59900Rs - 10% discount"
                                      .text
                                      .white
                                      .fontFamily(bold)
                                      .make(),
                                  5.heightBox,
                                  "= 53910Rs"
                                      .text
                                      .white
                                      .fontFamily(bold)
                                      .make(),
                                  10.heightBox,
                                ],
                              )
                                  .box
                                  .black
                                  .rounded
                                  .width(250)
                                  .margin(const EdgeInsets.all(8))
                                  .padding(const EdgeInsets.all(8))
                                  .make()),
                    ),
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                color: Colors.black,
                onPress: () {},
                textColor: Colors.white,
                title: "Add to Cart"),
          ).box.margin(const EdgeInsets.all(10)).make(),
        ],
      ),
    );
  }
}
