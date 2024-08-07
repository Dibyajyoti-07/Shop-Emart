import 'package:shop_emart/Common%20Wdgets/home_buttons.dart';
import 'package:shop_emart/consts/consts.dart';
import 'package:shop_emart/consts/lists.dart';
import 'package:shop_emart/views/home_screen/components/featured_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.black,
        padding: const EdgeInsets.all(12),
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: height * 0.06,
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchanything,
                    hintStyle: TextStyle(
                        color: Colors.grey[400], fontFamily: semibold),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      VxSwiper.builder(
                          aspectRatio: 19 / 9,
                          autoPlay: true,
                          height: 170,
                          enlargeCenterPage: true,
                          itemCount: slidersList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              slidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 15))
                                .make();
                          }),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => HomeButtons(
                                height: context.screenHeight * 0.15,
                                width: context.screenWidth / 2.8,
                                icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                title: index == 0 ? todayDeal : flashsale)),
                      ),
                      10.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 170,
                          enlargeCenterPage: true,
                          itemCount: secondSlidersList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              secondSlidersList[index],
                              fit: BoxFit.cover,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 15))
                                .make();
                          }),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            3,
                            (index) => HomeButtons(
                                  height: context.screenHeight * 0.12,
                                  width: context.screenWidth / 3.35,
                                  icon: index == 0
                                      ? icTopCategories
                                      : index == 1
                                          ? icBrands
                                          : icTopSeller,
                                  title: index == 0
                                      ? topcategories
                                      : index == 1
                                          ? brands
                                          : topseller,
                                )),
                      ),
                      20.heightBox,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: featuredcategories.text
                              .color(Colors.white)
                              .fontFamily(bold)
                              .size(18)
                              .make()),
                      20.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              3,
                              (index) => Column(
                                    children: [
                                      featuredButton(
                                        title: featuredlist1[index],
                                        icon: featuredImages1[index],
                                      ),
                                      10.heightBox,
                                      featuredButton(
                                          title: featuredlist2[index],
                                          icon: featuredImages2[index]),
                                    ],
                                  )).toList(),
                        ),
                      ),
                      20.heightBox,
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featuredproduct.text.black
                                .fontFamily(bold)
                                .size(22)
                                .make(),
                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    6,
                                    (index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
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
                      20.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 170,
                          enlargeCenterPage: true,
                          itemCount: secondSlidersList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              thirdSliderlist[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 15))
                                .make();
                          }),
                      20.heightBox,
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 350,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgP5,
                                  width: 220,
                                  height: 220,
                                  fit: BoxFit.fill,
                                ),
                                const Spacer(),
                                "Price - "
                                    .text
                                    .black
                                    .fontFamily(semibold)
                                    .make(),
                                const Spacer(),
                                "discount                     5999Rs - 49%"
                                    .text
                                    .black
                                    .fontFamily(bold)
                                    .make(),
                                const Spacer(),
                                "= 3000Rs".text.black.fontFamily(bold).make(),
                                const Spacer(),
                              ],
                            )
                                .box
                                .white
                                .padding(const EdgeInsets.all(10))
                                .rounded
                                .make();
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
