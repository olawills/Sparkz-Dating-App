class ApiConfig {
  static final String baseUrl = 'https://spark-dating-api.onrender.com/api/v1';

  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
  static const header = {
    'content-Type': 'application/json',
  };
}
// https://meet.google.com/adw-kynw-kgh