import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:mobile/features/auth/presentation/screens/register_screen.dart';
import 'package:mobile/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:mobile/features/home/presentation/screens/home_screen.dart';
import 'package:mobile/features/drama/presentation/screens/drama_detail_screen.dart';
import 'package:mobile/features/episode/presentation/screens/episode_detail_screen.dart';
import 'package:mobile/features/player/presentation/screens/player_screen.dart';
import 'package:mobile/features/library/presentation/screens/library_screen.dart';
import 'package:mobile/features/search/presentation/screens/search_screen.dart';
import 'package:mobile/features/profile/presentation/screens/profile_screen.dart';
import 'package:mobile/features/settings/presentation/screens/settings_screen.dart';
import 'package:mobile/features/auth/providers/auth_provider.dart';
import 'package:mobile/router/routes.dart';

/// GoRouter 제공자
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: AppPaths.home,
    debugLogDiagnostics: true,

    // 인증 상태에 따른 리디렉션
    redirect: (context, state) {
      // 현재 경로가 인증 관련 경로인지 확인
      final isAuthRoute = state.uri.toString().startsWith(AppPaths.auth);

      // 인증 상태에 따라 리디렉션
      if (authState.isLoading) {
        // 로딩 중에는 리디렉션 없음
        return null;
      } else if (!authState.isAuthenticated) {
        // 인증되지 않은 사용자가 인증 필요 경로에 접근하면 로그인으로 리디렉션
        if (!isAuthRoute && !state.uri.toString().startsWith(AppPaths.home)) {
          return AppPaths.login;
        }
      } else {
        // 인증된 사용자가 인증 경로에 접근하면 홈으로 리디렉션
        if (isAuthRoute) {
          return AppPaths.home;
        }
      }

      return null;
    },

    routes: [
      // 홈 화면
      GoRoute(
        path: AppPaths.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          // 드라마 상세
          GoRoute(
            path: 'dramas/:dramaId',
            name: AppRoutes.dramaDetail,
            builder: (context, state) {
              final dramaId = state.pathParameters['dramaId']!;
              return DramaDetailScreen(dramaId: dramaId);
            },
          ),
          // 에피소드 상세
          GoRoute(
            path: 'episodes/:episodeId',
            name: AppRoutes.episodeDetail,
            builder: (context, state) {
              final episodeId = state.pathParameters['episodeId']!;
              return EpisodeDetailScreen(episodeId: episodeId);
            },
          ),
        ],
      ),

      // 플레이어 화면
      GoRoute(
        path: AppPaths.player,
        name: AppRoutes.player,
        builder: (context, state) {
          final summaryId = state.pathParameters['summaryId']!;
          return PlayerScreen(summaryId: summaryId);
        },
      ),

      // 라이브러리 화면
      GoRoute(
        path: AppPaths.library,
        name: AppRoutes.library,
        builder: (context, state) => const LibraryScreen(),
      ),

      // 검색 화면
      GoRoute(
        path: AppPaths.search,
        name: AppRoutes.search,
        builder: (context, state) => const SearchScreen(),
      ),

      // 프로필 및 설정 화면
      GoRoute(
        path: AppPaths.profile,
        name: AppRoutes.profile,
        builder: (context, state) => const ProfileScreen(),
        routes: [
          // 설정 화면
          GoRoute(
            path: 'settings',
            name: AppRoutes.settings,
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),

      // 인증 관련 화면
      GoRoute(
        path: AppPaths.auth,
        name: AppRoutes.auth,
        builder: (context, state) => const LoginScreen(),
        routes: [
          // 로그인 화면
          GoRoute(
            path: 'login',
            name: AppRoutes.login,
            builder: (context, state) => const LoginScreen(),
          ),
          // 회원가입 화면
          GoRoute(
            path: 'register',
            name: AppRoutes.register,
            builder: (context, state) => const RegisterScreen(),
          ),
          // 비밀번호 찾기 화면
          GoRoute(
            path: 'forgot-password',
            name: AppRoutes.forgotPassword,
            builder: (context, state) => const ForgotPasswordScreen(),
          ),
        ],
      ),
    ],

    // 오류 화면
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('오류')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('페이지를 찾을 수 없습니다',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('경로: ${state.uri.toString()}',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppPaths.home),
              child: const Text('홈으로 돌아가기'),
            ),
          ],
        ),
      ),
    ),
  );
});
