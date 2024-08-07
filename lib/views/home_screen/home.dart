import 'package:get/get.dart';
import 'package:shop_emart/Controller/home_controller.dart';
import 'package:shop_emart/consts/consts.dart';
import 'package:shop_emart/views/cart_screen/cart_screen.dart';
import 'package:shop_emart/views/category_screem/caregory_screen.dart';
import 'package:shop_emart/views/home_screen/home_screen.dart';
import 'package:shop_emart/views/profile_screen/profile_screen.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  var controller = Get.put(HomeController());
  var navbarItem = [
    BottomNavigationBarItem(icon: Image.asset(icHome, width: 26), label: home),
    BottomNavigationBarItem(
        icon: Image.asset(icCategories, width: 26), label: categories),
    BottomNavigationBarItem(icon: Image.asset(icCart, width: 26), label: cart),
    BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 26,
        ),
        label: account),
  ];

  var navBody = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontFamily: bold),
          backgroundColor: Colors.black,
          items: navbarItem,
          onTap: (Value) {
            controller.currentNavIndex.value = Value;
          },
        ),
      ),
    );
  }
}
