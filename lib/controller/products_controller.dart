import 'dart:developer';

import 'package:badal/controller/products_services.dart';
import 'package:badal/utilits/api_url.dart';
import 'package:badal/utilits/methode_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badal/model/products_model.dart';
import 'package:badal/utilits/all_enum.dart';

// import '../../models/home_model/products_by_id.dart';

class ProductsController extends GetxController {
  ProductsServices productsServices = ProductsServices();
  LoadingState loadingState = LoadingState.initial;
  LoadingState loadingState2 = LoadingState.initial;
  LoadingState loadingStateProduct = LoadingState.initial;
  LoadingState loadingStateProductsById = LoadingState.initial;
  LoadingState loadingStateOffers = LoadingState.initial;
  List<Products> listProducts = [];
  TextEditingController searchTextProduct = TextEditingController();
  TextEditingController searchTextOffers = TextEditingController();

  String errorMessage = "";
  int pageNumber = 0;
  int pageSize = 5;

  ProductsModel productsModel = ProductsModel(
      products: [],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      currentPage: 0,
      totalCount: 0,
      totalPages: 0);

  ProductsModel offersModel = ProductsModel(
      products: [],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      currentPage: 0,
      totalCount: 0,
      totalPages: 0);

  ProductsModel allOffers = ProductsModel(
      products: [],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      currentPage: 0,
      totalCount: 0,
      totalPages: 0);

  bool expand = false;
  // String productId = Get.arguments ?? '';

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void initData() {
    // if (productId.isEmpty) getProducts();
    // if (productId.isNotEmpty) getProductsById(productId);
    getProducts();
  }

  getArguments() {
    return Get.arguments;
  }

  getProducts({
    String orderBy = '',
    String filter = '',
    bool showCustomPageSize = false,
    bool islSearchBySubCategory = false,
    int customPageSize = 10,
  }) async {
    pageNumber = 1;
    changeLoadingStateProduct(LoadingState.loading);

    log("message");
    try {
      productsModel = await productsServices
          .getProducts(
              orderBy: orderBy, pageNumber: 1, pageSize: 10, filter: filter)
          .timeout(const Duration(seconds: ApiUrl.timeLimit));
      changeLoadingStateProduct(LoadingState.loaded);
    } catch (error) {
      log("error $error");

      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingStateProduct(LoadingState.error),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  getProductsOnly({
    String orderBy = '',
    String filter = '',
    bool showCustomPageSize = false,
    bool islSearchBySubCategory = false,
    int customPageSize = 10,
  }) async {
    changeLoadingStateProduct(LoadingState.loading);
    try {
      productsModel = await productsServices
          .getProductsOnly(
              orderBy: orderBy,
              pageNumber: pageNumber,
              pageSize: !showCustomPageSize ? pageSize : customPageSize,
              filter: filter)
          .timeout(const Duration(seconds: ApiUrl.timeLimit));

      changeLoadingStateProduct(LoadingState.loaded);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingStateProduct(LoadingState.error),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  getOffers({
    String orderBy = '',
    String filter = '',
    bool showCustomPageSize = false,
    // required bool isSearch,
    int customPageSize = 10,
  }) async {
    changeLoadingStateOffers(LoadingState.loading);
    try {
      offersModel = await productsServices
          .getOffers(
              orderBy: orderBy,
              pageNumber: pageNumber,
              pageSize: !showCustomPageSize ? pageSize : customPageSize,
              filter: filter)
          .timeout(const Duration(seconds: ApiUrl.timeLimit));

      changeLoadingStateOffers(LoadingState.loaded);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingStateOffers(LoadingState.error),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  getAllOffers({
    String orderBy = '',
    String filter = '',
    bool showCustomPageSize = false,
    int customPageSize = 10,
  }) async {
    changeLoadingState2(LoadingState.loading);
    try {
      log("getAllOffers");

      allOffers = await productsServices
          .getOffers(
              orderBy: orderBy,
              pageNumber: pageNumber,
              pageSize: !showCustomPageSize ? pageSize : customPageSize,
              filter: filter)
          .timeout(const Duration(seconds: ApiUrl.timeLimit));

      changeLoadingState2(LoadingState.loaded);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState2(LoadingState.error),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  getAllOffersMore({
    String orderBy = '',
    String filter = '',
    bool showCustomPageSize = false,
    int customPageSize = 10,
  }) async {
    pageNumber = pageNumber + 1;

    try {
      log("getAllOffers");

      // allOffers = await
      productsServices
          .getOffers(
              orderBy: orderBy,
              pageNumber: pageNumber,
              pageSize: !showCustomPageSize ? pageSize : customPageSize,
              filter: filter)
          .timeout(const Duration(seconds: ApiUrl.timeLimit))
          .then(
              (value) => {allOffers.products.addAll(value.products), update()});
    } catch (error) {}
  }

  getProductMore({String orderBy = "", bool isMore = false}) async {
    // productsModel.totalCount = 0;
    pageNumber++;

    try {
      productsServices
          .getProductsOnly(
              filter: '',
              orderBy: orderBy,
              pageNumber: pageNumber,
              pageSize: pageSize)
          .timeout(const Duration(seconds: ApiUrl.timeLimit))
          .then((value) => {
                productsModel.products.addAll(
                  value.products,
                ),
                update()
              });
    } catch (error) {
      changeLoadingStateProduct(LoadingState.error);
    }
  }

  // searchProduct
  searchProduct() async {
    changeLoadingState(LoadingState.loading);
    try {
      productsModel.products = await productsServices
          .searchProduct(searchTextProduct.text)
          .timeout(const Duration(seconds: ApiUrl.timeLimit));

      changeLoadingState(LoadingState.loaded);
    } catch (error) {
      log("error $error");
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState(LoadingState.error),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  errorMessageUpdate(String error) {
    errorMessage = error;
    update();
  }

  changeLoadingState(LoadingState state,
      {dynamic key = '', dynamic value = ''}) {
    loadingState = state;
    update();
  }

  changeLoadingState2(LoadingState state,
      {dynamic key = '', dynamic value = ''}) {
    loadingState2 = state;
    update();
  }

  changeLoadingStateProduct(LoadingState state,
      {dynamic key = '', dynamic value = ''}) {
    loadingStateProduct = state;
    log("loadingStateProduct $loadingStateProduct");
    update();
  }

  changeLoadingStateProductsById(LoadingState state,
      {dynamic key = '', dynamic value = ''}) {
    loadingStateProductsById = state;
    update();
  }

  changeLoadingStateOffers(LoadingState state,
      {dynamic key = '', dynamic value = ''}) {
    loadingStateOffers = state;
    update();
  }

  changeExpandState() {
    expand = !expand;
    update();
  }

  clearSearch() {
    searchTextProduct.clear();
    searchTextOffers.clear();
    update();
  }
}
