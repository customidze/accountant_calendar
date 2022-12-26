import 'package:accountant_calendar/main.dart';
import 'package:accountant_calendar/models/year_model.dart';
import 'package:accountant_calendar/widgets/drawer_widget.dart';
import 'package:accountant_calendar/widgets/month_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final scMonth = ScrollController();
  final scTExt = ScrollController();

  YearModel ym = YearModel();
  upd() {
    scTExt.animateTo(scTExt.position.minScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    scMonth.addListener(
      () {
        final postion = scMonth.offset / scMonth.position.maxScrollExtent;

        if (postion >= 0.9) {
          print(postion);
        }
      },
    );
    return Scaffold(
      drawer: DrawerWidget(),
      appBar:
          AppBar(title: const Text('Календарь бухгалтера'), centerTitle: true),
      body: Column(
        children: [
          SizedBox(
            height: 2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            // width: MediaQuery.of(context).size.width * 0.4,
            child: Stack(
              children: [
                Center(
                    child: Text(
                  year.year.toString(),
                  style: TextStyle(
                      color: Color.fromARGB(117, 255, 82, 82), fontSize: 60),
                )),
                ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 2,
                      );
                    },
                    controller: scMonth,
                    scrollDirection: Axis.horizontal,
                    itemCount: ym.month.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MonthWidget(
                        name: ym.month[index],
                        upd: upd,
                        index: index,
                      );
                    }),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.775,
            child: ListView(
              controller: scTExt,
              children: [
                Text(mainText),
              ],
            ),
          )
        ],
      ),
    );
  }
}
