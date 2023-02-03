class AccountConfig {
  //Auth0
  static final String baseUrl = 'https://ajeshkumar.eu.auth0.com/';
  static final String clientId = 'Xcmx1whIj6t4qEUvzYkoXz1Icq3hHD3B';

  static final String newClientId = '347228001421-u27ghprpsqocf51b8g8ot71qta0inhgq.apps.googleusercontent.com';

  // static final String redirect = 'com.excelmec.app.excelapp://ajeshkumar.eu.auth0.com/android/com.excelmec.app.excelapp/callback';

  //Backend -- Accounts
  // static final String url = 'https://staging.accounts.excelmec.org/api/';
  static final String url = 'https://accounts.excelmec.org/api/';

  static final String newUrl = 'https://accountsbackend-xgveswperq-uc.a.run.app/';

  //header -- GET request
  static Map<String, String> getHeader(String token) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": 'Bearer $token',
    };
  }
}
