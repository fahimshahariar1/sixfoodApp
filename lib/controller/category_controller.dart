import 'package:get/get.dart';
import 'package:sixamfoodapp/data/api/api_checker.dart';
import 'package:sixamfoodapp/data/model/category_model.dart';
import 'package:sixamfoodapp/data/repository/category_repo.dart';

class CategoryController extends GetxController implements GetxService {
  final CategoryRepo categoryRepo;
  CategoryController ({required this.categoryRepo});

  List<CategoryModel>? _categoryList;

  List<CategoryModel>? get categoryList => _categoryList;

  Future<void> getCategoryList (bool reload) async {
    if (_categoryList == null || reload) {
      Response response = await categoryRepo.getCategoryList(); //keep track
      if (response.statusCode == 200) {
        _categoryList = [];
        response.body.forEach((category) {
          _categoryList!.add(CategoryModel.fromJson(category));
        });
      } else {
        ApiChecker.checkApi(response);
      }
      update(); // Notify listeners after updating the categoryList
    }
  }
}
