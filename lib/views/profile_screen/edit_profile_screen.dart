import 'dart:io';

import 'package:get/get.dart';
import 'package:shop_emart/Common%20Wdgets/bg_widget.dart';
import 'package:shop_emart/Common%20Wdgets/custom_textfield.dart';
import 'package:shop_emart/Common%20Wdgets/our_button.dart';
import 'package:shop_emart/Controller/profile_controller.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 150,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : data['imageUrl'] != '' &&
                            controller.profileImgPath.isEmpty
                        ? Image.network(
                            data['imageUrl'],
                            width: 150,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.file(
                            File(controller.profileImgPath.value),
                            width: 150,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                ourButton(
                    color: Colors.black,
                    onPress: () {
                      controller.changeImage(context);
                    },
                    textColor: whiteColor,
                    title: "Change"),
                const Divider(),
                20.heightBox,
                customTextField(
                    controller: controller.nameController,
                    hint: nameHint,
                    title: name,
                    isPass: false),
                10.heightBox,
                customTextField(
                    controller: controller.oldpassController,
                    hint: passwordHint,
                    title: oldpass,
                    isPass: true),
                10.heightBox,
                customTextField(
                    controller: controller.newpassController,
                    hint: passwordHint,
                    title: newpass,
                    isPass: true),
                20.heightBox,
                const Divider(),
                10.heightBox,
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.black),
                      )
                    : SizedBox(
                        width: context.screenWidth - 80,
                        child: ourButton(
                          color: Colors.black,
                          onPress: () async {
                            controller.isLoading(true);
                            try {
                              if (controller.profileImgPath.value.isNotEmpty) {
                                await controller.uploadProfileImage();
                              } else {
                                controller.profileImageLink = data['imageUrl'];
                              }

                              if (data['password'] ==
                                  controller.oldpassController.text) {
                                await controller.changeAuthPassword(
                                  email: data['email'],
                                  password: controller.oldpassController.text,
                                  newpassword:
                                      controller.newpassController.text,
                                );
                                await controller.updateProfile(
                                  imgUrl: controller.profileImageLink,
                                  name: controller.nameController.text,
                                  password: controller.newpassController.text,
                                );
                                VxToast.show(context, msg: "Updated");
                              } else {
                                VxToast.show(context,
                                    msg: 'Previous Password is incorrect');
                              }
                            } catch (e) {
                              VxToast.show(context,
                                  msg: 'An error occurred: $e');
                            } finally {
                              controller.isLoading(false);
                            }
                          },
                          textColor: whiteColor,
                          title: "Save",
                        ),
                      )
              ],
            )
                .box
                .white
                .shadowSm
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.all(16))
                .rounded
                .make(),
          ),
        ),
      ),
    );
  }
}
