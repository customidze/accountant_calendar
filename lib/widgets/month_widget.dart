import 'package:accountant_calendar/main.dart';
import 'package:accountant_calendar/txt_files/text.dart';
import 'package:flutter/material.dart';

class MonthWidget extends StatelessWidget {
  MonthWidget(
      {super.key, required this.name, required this.upd, required this.index});
  String name;
  Function upd;
  int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: MediaQuery.of(context).size.height * 0.1,
        // width: MediaQuery.of(context).size.width * 0.1,
        height: 100,
        width: 100,
        child: ListTile(
          //hoverColor: Colors.amber,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          tileColor:
              selectedMonth == name ? Colors.amberAccent : Colors.blueGrey,
          onTap: () {
            if (index == 0) {
              mainText = janyarText;
            } else if (index == 1) {
              mainText = februarText;
            } else if (index == 2) {
              mainText = marchText;
            } else if (index == 3) {
              mainText = aprilText;
            } else if (index == 4) {
              mainText = mayText;
            }
            selectedMonthIndex = index;
            selectedMonth = name;
            upd();
          },
          leading: Text(name),
        ));
  }
}
