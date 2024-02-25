import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/widgets/customized_text_field.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';

class DatePickerView extends StatelessWidget {
  const DatePickerView(
      {super.key,
      required this.onChooseDOB,
      this.chosenDate,
      this.isYear = false,
      this.isTime,
      required this.hintText});

  final Function(String) onChooseDOB;
  final String? chosenDate;
  final String hintText;
  final bool? isYear;
  final bool? isTime;

  @override
  Widget build(BuildContext context) {
    return CustomizedTextField(
      onChangeValue: (text) {},
      isReadOnly: true,
      labelText: hintText,
      inputValue: chosenDate,
      suffixIcon: const Icon(Icons.date_range),
      inputBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kLightBrownColor)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kLightBrownColor)),
      onTapTextField: () async {
        if (isYear ?? false) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const CustomizedTextView(
                  textData: "Selected Year",
                  textFontSize: kFont16,
                  textFontWeight: FontWeight.w600,
                ),
                content: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: YearPicker(
                    firstDate: DateTime(DateTime.now().year - 100, 1),
                    lastDate: DateTime(DateTime.now().year, 1),
                    selectedDate: DateTime.now(),
                    onChanged: (DateTime dateTime) {
                      // close the dialog when year is selected.
                      onChooseDOB(dateTime.year.toString());
                      Navigator.pop(context);

                      // Do something with the dateTime selected.
                      // Remember that you need to use dateTime.year to get the year
                    },
                  ),
                ),
              );
            },
          );
        } else if (isTime ?? false) {
          // TimePickerDialog(initialTime: TimeOfDay.now());
          Future<TimeOfDay?> selectedTime = showTimePicker(
            initialTime: TimeOfDay.now(),
            context: context,
          );

          selectedTime.then((value) {
            if (value != null) {
              onChooseDOB("${value.hour}-${value.minute}");
            }
          });
        } else {
          // Date ရွေးတဲ့ text field ကို နှိပ်လိုက်ရင် Calendar view ကို ပြပါမယ်/ ရွေးလိုက်တဲ့ date ကို ရလာပါမယ်
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now());

          if (pickedDate != null) {
            //ရလာတဲ့ date က null ဖြစ်မနေရင် date format ပြောင်းပြီး root widget ကို call back နဲ့ data ပြန်ပို့ပါတဉ်
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            onChooseDOB(formattedDate);
          } else {}
        }
      },
    );
  }
}
