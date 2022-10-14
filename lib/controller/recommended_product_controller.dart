import 'package:get/get.dart';
import 'package:lemon_hotel/data/repository/recommended_product_repo.dart';
import 'package:lemon_hotel/model/main_model/popular_product_mooel.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  get name => null;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("Sucessfully Got recommended product");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isloaded = true;
      // print(_recommendedProductList.toList());

      update();
    } else {
      print("could not get recommended product");
    }
  }
}
