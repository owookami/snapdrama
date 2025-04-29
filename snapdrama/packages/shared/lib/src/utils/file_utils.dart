import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:shared/src/constants/app_constants.dart';

/// 파일 관련 유틸리티 함수 모음
class FileUtils {
  /// 파일 크기를 사람이 읽기 쉬운 형태로 변환 (예: 1.5 MB)
  static String formatFileSize(int bytes) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(1)} ${suffixes[i]}';
  }

  /// 파일 확장자에 따른 MIME 타입 반환
  static String getMimeType(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();

    final mimeTypes = {
      // 이미지
      'jpg': 'image/jpeg',
      'jpeg': 'image/jpeg',
      'png': 'image/png',
      'gif': 'image/gif',
      'webp': 'image/webp',
      'bmp': 'image/bmp',

      // 문서
      'pdf': 'application/pdf',
      'doc': 'application/msword',
      'docx':
          'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'xls': 'application/vnd.ms-excel',
      'xlsx':
          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'ppt': 'application/vnd.ms-powerpoint',
      'pptx':
          'application/vnd.openxmlformats-officedocument.presentationml.presentation',
      'txt': 'text/plain',

      // 오디오
      'mp3': 'audio/mpeg',
      'wav': 'audio/wav',
      'aac': 'audio/aac',
      'm4a': 'audio/mp4',
      'ogg': 'audio/ogg',

      // 비디오
      'mp4': 'video/mp4',
      'mov': 'video/quicktime',
      'avi': 'video/x-msvideo',
      'mkv': 'video/x-matroska',
      'webm': 'video/webm',
    };

    return mimeTypes[extension] ?? 'application/octet-stream';
  }

  /// 파일 확장자가 이미지인지 확인
  static bool isImageFile(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    return AppConstants.supportedImageFormats.contains(extension);
  }

  /// 파일 확장자가 비디오인지 확인
  static bool isVideoFile(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    return AppConstants.supportedVideoFormats.contains(extension);
  }

  /// 파일 확장자가 오디오인지 확인
  static bool isAudioFile(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    return AppConstants.supportedAudioFormats.contains(extension);
  }

  /// 파일 크기 확인 (업로드 제한 체크)
  static bool isFileSizeValid(File file,
      {int maxSizeBytes = AppConstants.maxUploadFileSizeBytes}) {
    if (kIsWeb) return true; // 웹에서는 File.length() 미지원
    return file.lengthSync() <= maxSizeBytes;
  }

  /// 임시 파일명 생성
  static String generateTempFileName(String extension) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(9999);
    return 'temp_${timestamp}_$random.$extension';
  }

  /// 파일 경로에서 파일명만 추출
  static String getFileName(String filePath) {
    return filePath.split('/').last;
  }

  /// 파일 경로에서 확장자 없는 파일명 추출
  static String getFileNameWithoutExtension(String filePath) {
    final fileName = getFileName(filePath);
    final dotIndex = fileName.lastIndexOf('.');
    if (dotIndex == -1) return fileName;
    return fileName.substring(0, dotIndex);
  }
}
