class UserSession {
  /// The current user access token & locale
  static String? kAccessToken, kLocale, kUserId;
  static bool kIsLoggedIn = false;
  static double lat = 0.0;
  static double lng = 0.0;
}

class QuickHelpSession {
  static int kTasksPerPage = 10;
  static int kTasksPage = 1;
}
