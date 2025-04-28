import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase 클라이언트 제공자
final supabaseClientProvider = riverpod.Provider<SupabaseService>((ref) {
  // 실제 환경에서는 완전한 초기화 필요
  final client = Supabase.instance.client;
  return SupabaseService(client);
});

/// Supabase 초기화 클래스
class SupabaseService {
  final SupabaseClient client;

  SupabaseService(this.client);

  /// Supabase 초기화 메서드
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://your-project-url.supabase.co',
      anonKey: 'your-anon-key',
    );
  }

  /// 현재 인증된 사용자 조회
  User? get currentUser => client.auth.currentUser;

  /// 인증 상태 변경 스트림
  Stream get authStateChanges => client.auth.onAuthStateChange;

  /// 로그인
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// 회원가입
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    Map<String, dynamic>? userData,
  }) async {
    return await client.auth.signUp(
      email: email,
      password: password,
      data: userData,
    );
  }

  /// 로그아웃
  Future<void> signOut() async {
    await client.auth.signOut();
  }
}
