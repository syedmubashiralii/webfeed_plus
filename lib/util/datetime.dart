import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'timezone.dart';

DateTime? parseDateTime(dateString) {
  if (dateString == null) return null;
  return _parseRfc822DateTime(dateString) ?? _parseIso8601DateTime(dateString);
}

/// Try to parse `dateString` as an RFC 822 date.
/// We will parse the date string as UTC and then
/// subtract the actual time offset from the parsed string.
DateTime? _parseRfc822DateTime(String dateString) {
  initializeDateFormatting('zh_CN', null);

  /// The `Z` part is not yet implemented according to https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
  /// We will remove it for now and parse the timezone separately.
  const rfc822DatePattern = 'EEE, dd MMM yyyy HH:mm:ss';
  final rfc822DateFormats = [
    DateFormat(rfc822DatePattern, 'en_US'),
    DateFormat(rfc822DatePattern, 'zh_CN'),
  ];

  for (var rfc822DateFormat in rfc822DateFormats) {
    try {
      final localTime = rfc822DateFormat.parse(dateString, true);
      final timezone = dateString.trim().split(' ').last;

      final timeOffset = Duration(minutes: getTimeZoneOffset(timezone) ?? 0);
      return localTime.subtract(timeOffset).toUtc();
    } on FormatException {
      continue;
    }
  }
  return null;
}

DateTime? _parseIso8601DateTime(dateString) {
  try {
    return DateTime.parse(dateString);
  } on FormatException {
    return null;
  }
}
