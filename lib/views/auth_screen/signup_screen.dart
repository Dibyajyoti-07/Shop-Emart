import 'package:get/get.dart';
import 'package:shop_emart/Controller/auth_controller.dart';
import 'package:shop_emart/consts/consts.dart';
import 'package:shop_emart/views/home_screen/home.dart';

import '../../Common Wdgets/applogo_widget.dart';
import '../../Common Wdgets/bg_widget.dart';
import '../../Common Wdgets/custom_textfield.dart';
import '../../Common Wdgets/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.15).heightBox,
          applogoWidget(),
          2.heightBox,
          "Signup With $appname".text.fontFamily(bold).white.size(18).make(),
          20.heightBox,
          Obx(
            () => Column(
              children: [
                customTextField(
                    hint: nameHint,
                    title: name,
                    controller: nameController,
                    isPass: false),
                customTextField(
                    hint: emailHint,
                    title: email,
                    controller: emailController,
                    isPass: false),
                customTextField(
                    hint: passwordHint,
                    title: password,
                    controller: passwordController,
                    isPass: true),
                customTextField(
                    hint: passwordHint,
                    title: confirmPassword,
                    controller: confirmpasswordController,
                    isPass: true),

                Row(
                  children: [
                    Checkbox(
                        checkColor: Colors.white,
                        value: isCheck,
                        activeColor: Colors.black,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey,
                            )),
                        TextSpan(
                            text: termAndCond,
                            style: TextStyle(
                              fontFamily: bold,
                              color: Colors.black,
                            )),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey,
                            )),
                        TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(
                              fontFamily: bold,
                              color: Colors.black,
                            )),
                      ])),
                    )
                  ],
                ),
                5.heightBox,
                // ourButton().box.width(context.screenWidth - 50).make(),
                controller.isloading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.black),
                      )
                    : ourButton(
                        color:
                            isCheck == true ? Colors.black : Colors.grey[200],
                        title: signup,
                        textColor:
                            isCheck == true ? Colors.white : Colors.black,
                        onPress: () async {
                          if (isCheck != false) {
                            controller.isloading(true);
                            try {
                              await controller
                                  .signupMethod(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((Value) {
                                return controller.storeUserData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text);
                              }).then((Value) {
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(() => Home());
                              });
                            } catch (e) {
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());
                              controller.isloading(false);
                            }
                          }
                        }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                RichText(
                    text: const TextSpan(
                  children: [
                    TextSpan(
                        text: alreadyHaveAcount,
                        style: TextStyle(
                          fontFamily: bold,
                          color: fontGrey,
                        )),
                    TextSpan(
                      text: " Login",
                      style: TextStyle(fontFamily: bold, color: Colors.black),
                    ),
                  ],
                )).onTap(() {
                  Get.back();
                }),
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ),
        ],
      )),
    ));
  }
}
