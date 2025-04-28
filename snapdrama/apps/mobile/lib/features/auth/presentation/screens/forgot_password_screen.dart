import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/router/routes.dart';
import 'package:mobile/shared/widgets/sd_button.dart';
import 'package:mobile/shared/widgets/sd_footer.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _isEmailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('비밀번호 찾기'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 아이콘 및 헤더
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.colorScheme.primary.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.lock_reset,
                          size: 40,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 제목 및 안내 텍스트
                    Text(
                      '비밀번호를 잊으셨나요?',
                      style: theme.textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    if (!_isEmailSent) ...[
                      Text(
                        '가입 시 등록한 이메일 주소를 입력하시면 비밀번호 재설정 링크를 보내드립니다.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),

                      // 이메일 입력 폼
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: '이메일',
                                hintText: 'example@email.com',
                                prefixIcon: Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '이메일을 입력해주세요';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return '올바른 이메일 형식이 아닙니다';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            SdButton(
                              label: '비밀번호 재설정 링크 전송',
                              isLoading: _isLoading,
                              isFullWidth: true,
                              onPressed:
                                  _isLoading ? null : _handleResetPassword,
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      // 이메일 전송 완료 화면
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              size: 64,
                              color: Colors.green,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '이메일을 확인해주세요!',
                              style: theme.textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '${_emailController.text}로 비밀번호 재설정 링크를 발송했습니다. 이메일의 지침에 따라 비밀번호를 재설정해주세요.',
                              style: theme.textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            SdButton(
                              label: '로그인으로 돌아가기',
                              variant: SdButtonVariant.secondary,
                              isFullWidth: true,
                              onPressed: () => context.goNamed(AppRoutes.login),
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isEmailSent = false;
                                });
                              },
                              child: const Text('다른 이메일 주소로 다시 시도'),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const Spacer(),

                    // 로그인 링크
                    if (!_isEmailSent)
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '비밀번호가 기억나셨나요?',
                              style: theme.textTheme.bodyMedium,
                            ),
                            TextButton(
                              onPressed: () {
                                context.goNamed(AppRoutes.login);
                              },
                              child: const Text('로그인'),
                            ),
                          ],
                        ),
                      ),

                    // 푸터
                    const SdFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 비밀번호 재설정 처리
  Future<void> _handleResetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // 여기에 비밀번호 재설정 로직 구현 (나중에 추가)
        await Future.delayed(const Duration(seconds: 2)); // 임시 지연

        // 이메일 발송 완료 상태로 전환
        if (mounted) {
          setState(() {
            _isLoading = false;
            _isEmailSent = true;
          });
        }
      } catch (e) {
        // 오류 처리
        if (mounted) {
          setState(() {
            _isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('비밀번호 재설정 링크 전송 실패: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
