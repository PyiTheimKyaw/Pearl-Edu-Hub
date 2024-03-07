import 'package:intl/intl.dart';

extension StringExtension on String {
  String formattedTime() {
    return DateFormat('h:mm a').format(DateFormat.Hm().parse(this));
  }

  String formattedCurrency(){
    return "${NumberFormat("#,##0", "en_US").format(int.parse(this)).toString()} MMK";
  }
}
