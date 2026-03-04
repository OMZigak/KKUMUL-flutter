class AppConfig {
  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');
  static const String appName =
      String.fromEnvironment('APP_NAME', defaultValue: 'KKUMUL Dev');
  static const String appSuffix =
      String.fromEnvironment('APP_SUFFIX', defaultValue: '.dev');
  static const String apiBaseUrl =
      String.fromEnvironment('API_BASE_URL', defaultValue: 'https://dev-api.kkumul.com');

  static bool get isDev => env == 'dev';
  static bool get isProd => env == 'prod';
}
