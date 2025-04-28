import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/router/routes.dart';
import 'package:mobile/shared/widgets/sd_button.dart';
import 'package:mobile/shared/widgets/sd_footer.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  bool _agreeTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
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
                    // 상단 텍스트
                    Text(
                      'SnapDrama에 가입하세요',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'K-Drama 회차 요약을 간편하게 즐기세요',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),

                    // 회원가입 폼
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // 이름 입력 필드
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: '이름',
                              hintText: '이름을 입력하세요',
                              prefixIcon: Icon(Icons.person),
                            ),
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '이름을 입력해주세요';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // 이메일 입력 필드
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
                          const SizedBox(height: 16),

                          // 비밀번호 입력 필드
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: '비밀번호',
                              hintText: '8자 이상, 숫자 및 특수문자 포함',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: !_isPasswordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '비밀번호를 입력해주세요';
                              }
                              if (value.length < 8) {
                                return '비밀번호는 8자 이상이어야 합니다';
                              }
                              if (!RegExp(r'[0-9]').hasMatch(value)) {
                                return '비밀번호에 숫자를 포함해주세요';
                              }
                              if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                  .hasMatch(value)) {
                                return '비밀번호에 특수문자를 포함해주세요';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // 비밀번호 확인 입력 필드
                          TextFormField(
                            controller: _confirmPasswordController,
                            decoration: const InputDecoration(
                              labelText: '비밀번호 확인',
                              hintText: '비밀번호를 다시 입력하세요',
                              prefixIcon: Icon(Icons.lock_outline),
                            ),
                            obscureText: !_isPasswordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '비밀번호를 다시 입력해주세요';
                              }
                              if (value != _passwordController.text) {
                                return '비밀번호가 일치하지 않습니다';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // 이용약관 동의
                          Row(
                            children: [
                              Checkbox(
                                value: _agreeTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _agreeTerms = value ?? false;
                                  });
                                },
                              ),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Text(
                                      '이용약관 및 개인정보처리방침에 동의합니다',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // 약관 보기 액션
                                      },
                                      child: const Text('약관 보기'),
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // 회원가입 버튼
                          SdButton(
                            label: '회원가입',
                            isLoading: _isLoading,
                            isFullWidth: true,
                            onPressed: !_agreeTerms || _isLoading
                                ? null
                                : _handleRegister,
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    // 로그인 링크
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '이미 계정이 있으신가요?',
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

  // 회원가입 처리
  Future<void> _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // 여기에 회원가입 로직 구현 (나중에 추가)
        await Future.delayed(const Duration(seconds: 2)); // 임시 지연

        // 성공 처리
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('회원가입이 완료되었습니다. 이메일을 확인해주세요.'),
              backgroundColor: Colors.green,
            ),
          );

          // 로그인 화면으로 이동
          context.goNamed(AppRoutes.login);
        }
      } catch (e) {
        // 오류 처리
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('회원가입 실패: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }
}
