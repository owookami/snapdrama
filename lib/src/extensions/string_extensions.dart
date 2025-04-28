/// String 클래스에 대한 유용한 확장 기능
extension StringExtensions on String {
  /// 문자열의 첫 글자를 대문자로 변환
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// 문자열이 유효한 이메일 주소인지 확인
  bool get isValidEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(this);
  }

  /// 문자열이 URL인지 확인
  bool get isValidUrl {
    return startsWith('http://') || startsWith('https://');
  }

  /// 문자열에서 HTML 태그 제거
  String removeHtmlTags() {
    return replaceAll(RegExp(r'<[^>]*>'), '');
  }

  /// 문자열을 지정된 길이로 자르고 말줄임표 추가
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }
}
