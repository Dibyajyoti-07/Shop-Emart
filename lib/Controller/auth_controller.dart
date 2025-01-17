import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop_emart/consts/consts.dart';

import '../views/home_screen/home.dart';

class AuthController extends GetxController {
  var isloading = false.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      await auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((Value) {
        print(Value);
        VxToast.show(context, msg: loggedin);
        Get.offAll(() => Home());
      });
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // signup method

  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // storing data method

  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
      'cart_count': '00',
      'wishlist_count': '00',
      'order_count': '00',
    });
  }

  // signout method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
