import 'package:accountant_calendar/main.dart';
import 'package:accountant_calendar/models/year_model.dart';
import 'package:accountant_calendar/pages/test_animation.dart';
import 'package:accountant_calendar/widgets/drawer_widget.dart';
import 'package:accountant_calendar/widgets/month_widget.dart';
import 'package:accountant_calendar/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:system_alert_window/system_alert_window.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => MainPageState();
  static MainPageState? of(BuildContext context) =>
      context.findAncestorStateOfType<MainPageState>();
}

class MainPageState extends State<MainPage> {
  // SystemWindowHeader header = SystemWindowHeader(
  //     title: SystemWindowText(
  //         text: "Incoming Call", fontSize: 10, textColor: Colors.black45),
  //     padding: SystemWindowPadding.setSymmetricPadding(12, 12),
  //     subTitle: SystemWindowText(
  //         text: "+7 916 199 99 84",
  //         fontSize: 14,
  //         fontWeight: FontWeight.BOLD,
  //         textColor: Colors.black87),
  //     decoration: SystemWindowDecoration(startColor: Colors.grey[100]),
  //     button: SystemWindowButton(
  //         text: SystemWindowText(
  //             text: "close", fontSize: 10, textColor: Colors.black45),
  //         tag: "close_btn"),
  //     buttonPosition: ButtonPosition.TRAILING);

  // SystemWindowFooter footer = SystemWindowFooter(
  //     buttons: [
  //       SystemWindowButton(
  //         text: SystemWindowText(
  //             text: "Simple button",
  //             fontSize: 12,
  //             textColor: Color.fromRGBO(250, 139, 97, 1)),
  //         tag: "simple_button", //useful to identify button click event
  //         padding:
  //             SystemWindowPadding(left: 10, right: 10, bottom: 10, top: 10),
  //         width: 0,
  //         height: SystemWindowButton.WRAP_CONTENT,
  //         decoration: SystemWindowDecoration(
  //             startColor: Colors.white,
  //             endColor: Colors.white,
  //             borderWidth: 0,
  //             borderRadius: 0.0),
  //       ),
  //       SystemWindowButton(
  //         text: SystemWindowText(
  //             text: "Focus button", fontSize: 12, textColor: Colors.white),
  //         tag: "focus_button",
  //         width: 0,
  //         padding:
  //             SystemWindowPadding(left: 10, right: 10, bottom: 10, top: 10),
  //         height: SystemWindowButton.WRAP_CONTENT,
  //         decoration: SystemWindowDecoration(
  //             startColor: Color.fromRGBO(250, 139, 97, 1),
  //             endColor: Color.fromRGBO(247, 28, 88, 1),
  //             borderWidth: 0,
  //             borderRadius: 30.0),
  //       )
  //     ],
  //     padding: SystemWindowPadding(left: 16, right: 16, bottom: 12),
  //     decoration: SystemWindowDecoration(startColor: Colors.white),
  //     buttonsPosition: ButtonPosition.CENTER);

  // SystemWindowBody body = SystemWindowBody(
  //   rows: [
  //     EachRow(
  //       columns: [
  //         EachColumn(
  //           text: SystemWindowText(
  //               text: "Some body", fontSize: 12, textColor: Colors.black45),
  //         ),
  //       ],
  //       gravity: ContentGravity.CENTER,
  //     ),
  //   ],
  //   padding: SystemWindowPadding(left: 16, right: 16, bottom: 12, top: 12),
  // );

  final scMonth = ScrollController();
  final scTExt = ScrollController();

  YearModel ym = YearModel();
  upd() {
    // scTExt.animateTo(scTExt.position.minScrollExtent,
    //     duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    // scTExt.animateTo(ym.position[selectedMonthIndex!],
    //     duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    //scTExt.jumpTo(ym.position[selectedMonthIndex!]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    scTExt.addListener(() {
      print(scTExt.offset);
      ym.position[selectedMonthIndex!] = scTExt.offset.toDouble();
    });
    scMonth.addListener(
      () {
        final postion = scMonth.offset / scMonth.position.maxScrollExtent;

        if (postion >= 0.9) {
          print(postion);
        }
      },
    );
    //return CircularCountdownWidget();
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Календарь бухгалтера'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                // await SystemAlertWindow.requestPermissions;

                // SystemAlertWindow.showSystemWindow(
                //     height: 230,
                //     header: header,
                //     body: body,
                //     footer: footer,
                //     margin: SystemWindowMargin(
                //         left: 8, right: 8, top: 100, bottom: 0),
                //     gravity: SystemWindowGravity.TOP,
                //     notificationTitle: "Incoming Call",
                //     notificationBody: "+7 916 199 99 84",
                //     prefMode: SystemWindowPrefMode.DEFAULT);

                //   SystemAlertWindow.registerOnClickListener(callBackFunction);
              },
              icon: const Icon(Icons.account_balance))
        ],
      ),
      body: Column(
        children: [
          //CircularCountdownWidget(animationController: AnimationController(vsync: this)),
          const SizedBox(
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
                  style: const TextStyle(
                      color: Color.fromARGB(117, 255, 82, 82), fontSize: 60),
                )),
                ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
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
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView(
              controller: scTExt,
              children: [
                Text(mainText),
                //mainText,
                
              ],
            ),
          ),
          Container(
        child: ProgessIndicator(radius: 20),
        // height: MediaQuery.of(context).size.height * 0.15,
        // width: MediaQuery.of(context).size.width,
        //color: Colors.black,
        padding: EdgeInsets.all(30.0),
      ),
      
        ],
      ),
    );
  }
}

void callBackFunction(String tag) {
  SystemAlertWindow.closeSystemWindow();
  // switch(tag){
  //   case "close_btn":
  //     print("Simple button has been clicked");
  //     break;
  //   case "focus_button":
  //     print("Focus button has been clicked");
  //     break;
  //   case "personal_btn":
  //     print("Personal button has been clicked");
  //     break;
  //   default:
  //     print("OnClick event of $tag");
  // }
}

