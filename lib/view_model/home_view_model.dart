import 'package:flutter/cupertino.dart';

import '../../data/response/api_response.dart';
import '../../respository/home_repository.dart';
import '../model/product_model.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<ProductListModel> moviesList = ApiResponse.loading();
  setMoviesList(ApiResponse<ProductListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviewListApi({data}) async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMovieList(data).then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
