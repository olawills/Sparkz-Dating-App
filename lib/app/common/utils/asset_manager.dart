import 'package:coolicons/coolicons.dart';

class Assets {
  Assets._();
  static String helper(String image) => 'assets/icons/$image.png';
  static String svgHelper(String image) => 'assets/icons/$image.svg';
  static String noInternetImage = 'assets/images/no-wifi.png';
  static String noAccountImage = 'assets/images/no-account.png';
}

class AppIcons {
  // Social Media Icons
  static final gbIcon = Coolicons.google;
  static final fbIcon = Coolicons.facebook;
  static final linkedln = Coolicons.LinkedIn;
}
