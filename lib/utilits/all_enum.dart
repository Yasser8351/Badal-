enum LoadingState {
  initial,
  loading,
  loaded,
  socketException,
  timeout,
  noDataFound,
  error,
  empty,
}

enum ShimmerType {
  shimmerCircular,
  shimmerHorizontal,
  shimmerRectangular,
  shimmerListRectangular,
  circularProgressIndicator,
  none
}

enum LoadingType { login, none }
