import 'package:intl/intl.dart';

extension StringExtension on String {
  String formattedTime() {
    return DateFormat('h:mm a').format(DateFormat.Hm().parse(this));
  }

  String formattedCurrency(){
    return "${NumberFormat("#,##0", "en_US").format(int.parse(this)).toString()} MMK";
  }

  String formatPhoneNumber() {
    if (length != 11) {
      return this; // Invalid phone number format
    }

    String formattedNumber = '${substring(0, 2)} '; // Add first two digits with space

    for (int i = 2; i < length; i += 3) {
      formattedNumber += '${substring(i, i + 3)} '; // Add next three digits with space
    }

    return formattedNumber.trim(); // Remove trailing space
  }

}
