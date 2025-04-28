import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile/core/utils/supabase_client.dart';

part 'auth_provider.freezed.dart';

// 인증 상태 클래스 (freezed)
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isAuthenticated,
    required bool isLoading,
    String? userId,
    String? email,
    String? errorMessage,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
        isAuthenticated: false,
        isLoading: true,
        userId: null,
        email: null,
        errorMessage: null,
      );
}

// 인증 상태 관리 Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final SupabaseService _supabaseService;

  AuthNotifier(this._supabaseService) : super(AuthState.initial()) {
    _initialize();
  }

  // 초기화
  Future<void> _initialize() async {
    try {
      final currentUser = _supabaseService.currentUser;

      if (currentUser != null) {
        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
          userId: currentUser.id,
          email: currentUser.email,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }

      // 인증 상태 변경 리스너 설정
      _supabaseService.authStateChanges.listen(_handleAuthChange);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '인증 상태 확인 중 오류가 발생했습니다',
      );
    }
  }

  // 인증 상태 변경 핸들러
  void _handleAuthChange(dynamic authState) {
    final user = authState.session?.user;

    if (user != null) {
      state = state.copyWith(
        isAuthenticated: true,
        userId: user.id,
        email: user.email,
        errorMessage: null,
      );
    } else {
      state = state.copyWith(
        isAuthenticated: false,
        userId: null,
        email: null,
      );
    }
  }

  // 로그인
  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _supabaseService.signIn(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user != null) {
        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
          userId: user.id,
          email: user.email,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: '로그인에 실패했습니다',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '로그인 중 오류가 발생했습니다: ${e.toString()}',
      );
    }
  }

  // 회원가입
  Future<void> register({
    required String email,
    required String password,
    String? name,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _supabaseService.signUp(
        email: email,
        password: password,
        userData: name != null ? {'name': name} : null,
      );

      final user = response.user;

      if (user != null) {
        state = state.copyWith(
          isLoading: false,
          // 이메일 확인이 필요한 경우 바로 로그인 상태로 변경하지 않음
          // isAuthenticated는 authStateChanges 리스너에서 처리됨
          userId: user.id,
          email: user.email,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: '회원가입에 실패했습니다',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '회원가입 중 오류가 발생했습니다: ${e.toString()}',
      );
    }
  }

  // 로그아웃
  Future<void> logout() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _supabaseService.signOut();

      state = state.copyWith(
        isAuthenticated: false,
        isLoading: false,
        userId: null,
        email: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '로그아웃 중 오류가 발생했습니다: ${e.toString()}',
      );
    }
  }

  // 비밀번호 재설정 이메일 전송
  Future<void> resetPassword(String email) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _supabaseService.client.auth.resetPasswordForEmail(email);

      state = state.copyWith(
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '비밀번호 재설정 이메일 전송 중 오류가 발생했습니다: ${e.toString()}',
      );
    }
  }
}

// 인증 프로바이더 (Riverpod)
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final supabaseService = ref.watch(supabaseClientProvider);
  return AuthNotifier(supabaseService);
});
