import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shop_emart/Common%20Wdgets/bg_widget.dart';
import 'package:shop_emart/Controller/auth_controller.dart';
import 'package:shop_emart/Controller/profile_controller.dart';
import 'package:shop_emart/consts/consts.dart';
import 'package:shop_emart/consts/lists.dart';
import 'package:shop_emart/services/firestore_services.dart';
import 'package:shop_emart/views/auth_screen/login_screen.dart';
import 'package:shop_emart/views/cart_screen/components/details_card.dart';
import 'package:shop_emart/views/profile_screen/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
          body: StreamBuilder(
              stream: FirestoreServices.getUser(currentUser!.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.black),
                    ),
                  );
                } else {
                  var data = snapshot.data!.docs[0];
                  return SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )).onTap(() {
                            controller.nameController.text = data['name'];
                            Get.to(() => EditProfileScreen(data: data));
                          }),
                          Row(
                            children: [
                              data['imageUrl'] == ''
                                  ? Image.asset(
                                      imgProfile2,
                                      width: 80,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(
                                      data['imageUrl'],
                                      width: 80,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),
                              10.widthBox,
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['name']}"
                                      .text
                                      .white
                                      .fontFamily(semibold)
                                      .size(18)
                                      .make(),
                                  "${data['email']}"
                                      .text
                                      .white
                                      .fontFamily(semibold)
                                      .size(16)
                                      .make()
                                ],
                              )),
                              OutlinedButton(
                                  onPressed: () async {
                                    await Get.put(AuthController())
                                        .signoutMethod(context);
                                    Get.offAll(() => const LoginScreen());
                                  },
                                  child: logout.text
                                      .fontFamily(semibold)
                                      .white
                                      .make())
                            ],
                          ),
                          20.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DetailsCard(
                                  count: data['cart_count'],
                                  title: "in your cart",
                                  width: context.screenWidth / 3.2),
                              DetailsCard(
                                  count: data['wishlist_count'],
                                  title: "in your wishlist",
                                  width: context.screenWidth / 3.2),
                              DetailsCard(
                                  count: data['order_count'],
                                  title: "your orders",
                                  width: context.screenWidth / 3.2),
                            ],
                          ),
                          40.heightBox,
                          ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return ListTile(
                                      leading: Image.asset(
                                        profileButtonIcons[index],
                                        width: 22,
                                        color: Colors.black,
                                      ),
                                      title: profileButtonList[index]
                                          .text
                                          .fontFamily(semibold)
                                          .color(darkFontGrey)
                                          .make(),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      color: darkFontGrey,
                                    );
                                  },
                                  itemCount: profileButtonList.length)
                              .box
                              .white
                              .rounded
                              .shadow
                              .padding(const EdgeInsets.all(10))
                              .margin(const EdgeInsets.all(8))
                              .make(),
                        ],
                      ),
                    ),
                  );
                }
              })),
    );
  }
}
