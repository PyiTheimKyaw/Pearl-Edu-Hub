import 'package:intl/intl.dart';

extension StringExtension on String {
  String formattedTime() {
    return DateFormat('h:mm a').format(DateFormat.Hm().parse(this));
  }
}
