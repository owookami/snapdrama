// TODO Implement this library.
import 'package:intl/intl.dart';

/// DateTime 클래스에 대한 유용한 확장 기능
extension DateTimeExtensions on DateTime {
  /// 날짜를 'yyyy-MM-dd' 형식의 문자열로 변환
  String toYMD() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// 날짜를 'yyyy년 MM월 dd일' 형식의 문자열로 변환
  String toKoreanFormat() {
    return DateFormat('yyyy년 MM월 dd일').format(this);
  }

  /// 현재 시간과의 차이를 사람이 읽기 쉬운 형식으로 반환 (예: "3시간 전")
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()}년 전';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()}개월 전';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }
  }
}
