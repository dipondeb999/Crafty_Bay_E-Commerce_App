class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signInUrl = '$_baseUrl/auth/login';
  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';

  static const String bannerListUrl = '$_baseUrl/ListProductSlider';
  static const String categoryListUrl = '$_baseUrl/CategoryList';
  static String productListByRemarkUrl(String remark) => '$_baseUrl/ListProductByRemark/$remark';
  static String productListByCategoryUrl(int categoryId) => '$_baseUrl/ListProductByCategory/$categoryId';
  static String productDetailsUrl(int productId) => '$_baseUrl/ProductDetailsById/$productId';
}