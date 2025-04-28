/// 앱의 라우트 이름을 정의합니다.
abstract class AppRoutes {
  // 메인 라우트
  static const String home = 'home';
  static const String dramaDetail = 'drama-detail';
  static const String episodeDetail = 'episode-detail';
  static const String player = 'player';

  // 라이브러리 라우트
  static const String library = 'library';
  static const String collectionDetail = 'collection-detail';

  // 검색 라우트
  static const String search = 'search';

  // 프로필 및 설정 라우트
  static const String profile = 'profile';
  static const String settings = 'settings';
  static const String subscription = 'subscription';

  // 인증 관련 라우트
  static const String auth = 'auth';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgot-password';
}

/// 앱의 라우트 경로를 정의합니다.
abstract class AppPaths {
  // 메인 경로
  static const String home = '/';
  static const String dramaDetail = '/dramas/:dramaId';
  static const String episodeDetail = '/episodes/:episodeId';
  static const String player = '/player/:summaryId';

  // 라이브러리 경로
  static const String library = '/library';
  static const String collectionDetail = '/library/collections/:collectionId';

  // 검색 경로
  static const String search = '/search';

  // 프로필 및 설정 경로
  static const String profile = '/profile';
  static const String settings = '/profile/settings';
  static const String subscription = '/profile/subscription';

  // 인증 관련 경로
  static const String auth = '/auth';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
}
