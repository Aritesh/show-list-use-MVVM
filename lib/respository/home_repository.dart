import '../../model/product_model.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<ProductListModel> fetchMovieList(data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          data.toString() == "null"
              ? AppUrl.productListEndPoint
              : "${AppUrl.productListEndPoint}=${data.toString()}");
      print(response);
      return response = ProductListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
