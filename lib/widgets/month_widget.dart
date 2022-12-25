import 'package:accountant_calendar/main.dart';
import 'package:flutter/material.dart';

class MonthWidget extends StatelessWidget {
  MonthWidget({super.key, required this.name, required this.upd});
  String name;
  Function upd;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: MediaQuery.of(context).size.height * 0.1,
        // width: MediaQuery.of(context).size.width * 0.1,
        height: 100,
        width: 100,
        child: ListTile(
          //hoverColor: Colors.amber,

          tileColor:
              selectedMonth == name ? Colors.amberAccent : Colors.blueGrey,
          onTap: () {
            selectedMonth = name;
            upd();
          },
          leading: Text(name),
        ));
  }
}
