import 'package:get/get.dart';
import 'package:shop_emart/Common%20Wdgets/applogo_widget.dart';
import 'package:shop_emart/Common%20Wdgets/bg_widget.dart';
import 'package:shop_emart/Common%20Wdgets/custom_textfield.dart';
import 'package:shop_emart/Common%20Wdgets/our_button.dart';
import 'package:shop_emart/Controller/auth_controller.dart';
import 'package:shop_emart/consts/consts.dart';
import 'package:shop_emart/consts/lists.dart';
import 'package:shop_emart/views/auth_screen/signup_screen.dart';
import 'package:shop_emart/views/home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.15).heightBox,
          applogoWidget(),
          2.heightBox,
          "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
          20.heightBox,
          Obx(
            () => Column(
              children: [
                customTextField(
                    hint: emailHint,
                    title: email,
                    isPass: false,
                    controller: controller.emailController),
                10.heightBox,
                customTextField(
                    hint: passwordHint,
                    title: password,
                    isPass: true,
                    controller: controller.passwordController),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgotpass.text.black.make())),
                5.heightBox,
                // ourButton().box.width(context.screenWidth - 50).make(),
                controller.isloading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.black),
                      )
                    : ourButton(
                        color: Colors.black,
                        title: login,
                        textColor: Colors.white,
                        onPress: () async {
                          controller.isloading(true);
                          await controller
                              .loginMethod(context: context)
                              .then((Value) {
                            print(Value);
                            if (Value != null) {
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(() => Home());
                            } else {
                              controller.isloading(false);
                            }
                          });
                        }).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                    color: Colors.grey[200],
                    title: signup,
                    textColor: Colors.black,
                    onPress: () {
                      Get.to(() => const SignupScreen());
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              radius: 25,
                              child: Image.asset(socialIconsList[index],
                                  width: 30),
                            ),
                          )),
                )
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          )
        ],
      )),
    ));
  }
}
