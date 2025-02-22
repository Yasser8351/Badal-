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
enum WidgetType { status, type }

enum ExpandeIndexType {
  category,
  subCategory,
  filterSearch,
  filterWithLocation,
  clearAllFilter,
}

enum DropdownType {
  category,
  subCategory,
  city,
  state,
  none,
}
