import 'dart:convert';
import 'dart:developer';

import 'package:badal/base_request/base_http_service.dart';
import 'package:badal/model/products_model.dart';
import 'package:dio/dio.dart';

class ProductsServices extends BaseHttpService {
  @override
  String get path => "Products";

  Future<ProductsModel> getProducts({
    required String orderBy,
    required String filter,
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      var response = await get(
          params:
              "?order=$orderBy&page=$pageNumber&pageSize=$pageSize&filter=$filter");

      var res = await json.decode(json.encode(response.data));
      final model = ProductsModel.fromJson(res);

      log("response $response");

      return model;
    } catch (error) {
      rethrow;
    }
  }

  Future<ProductsModel> getProductsOnly({
    required String orderBy,
    required String filter,
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      var response = await get(
          params:
              "/GetProductsOnly?order=$orderBy&page=$pageNumber&pageSize=$pageSize&filter=$filter");

      var res = await json.decode(json.encode(response.data));
      final model = ProductsModel.fromJson(res);

      return model;
    } catch (error) {
      // if (error is DioException) {
      //   log("error methode getProducts ${error.response!}");

      //   if (error.response!.statusCode == 401) {
      //     dialogApp(
      //       title: AppConfig.alert.tr,
      //       image: AppImage.error,
      //       isSvg: true,
      //       description: error.response!.statusMessage ?? "دخول غير مصرح به",
      //       textButtonConfirm: AppConfig.ok.tr,
      //     );
      //     // Get.to(() => const LoginScreen());
      //   }
      // }
      rethrow;
    }
  }

  Future<ProductsModel> getOffers({
    required String orderBy,
    required String filter,
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      var response = await get(
          params:
              "/GetProductsOffers?order=$orderBy&page=$pageNumber&pageSize=$pageSize&filter=$filter");

      var res = await json.decode(json.encode(response.data));
      final model = ProductsModel.fromJson(res);

      return model;
    } catch (error) {
      if (error is DioException) {
        if (error.response!.statusCode == 401) {
          // Get.to(() => const LoginScreen());
        }
      }
      rethrow;
    }
  }

  Future<List<Products>> getProductBySubCategoryId(
      {required int subCategoryId}) async {
    try {
      var response = await get(
          params: "/GetProductBySubCategoryId?SubCategoryId=$subCategoryId");

      var res = await json.decode(json.encode(response.data));
      final model = ProductsModel.fromJson(res);

      return model.products;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Products>> searchProduct(String searchText) async {
    try {
      List<Products> list = [];

      var response = await get(params: "/SearchProduct?name=$searchText");

      var res = await json.decode(json.encode(response.data));
      final model = ProductsModel.fromJson(res);
      list = model.products;

      return list;
    } catch (error) {
      rethrow;
    }
  }
}
