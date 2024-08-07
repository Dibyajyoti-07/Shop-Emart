import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_emart/Models/category_model.dart';
import 'package:shop_emart/consts/consts.dart';

class ProductController extends GetxController {
  var subcat = <String>[].obs;

  getSubCategories(String title) async {
    try {
      subcat.clear();
      var data =
          await rootBundle.loadString("lib/services/category_model.json");
      var decoded = categoryModelFromJson(data);

      var s =
          decoded.categories.where((element) => element.name == title).toList();
      if (s.isNotEmpty) {
        subcat.addAll(s[0].subcategory);
      } else {
        print("Category not found");
      }
    } catch (e) {
      print("Error loading subcategories: $e");
    }
  }
}
