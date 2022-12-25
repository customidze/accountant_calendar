import 'package:accountant_calendar/models/year_model.dart';
import 'package:accountant_calendar/widgets/month_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final scMonth = ScrollController();
  
  YearModel ym = YearModel();
  upd(){
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    scMonth.addListener(() {
      final postion = scMonth.offset / scMonth.position.maxScrollExtent;

      if(postion>= 0.9){
        print(postion);
      }

    },);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            // width: MediaQuery.of(context).size.width * 0.4,
            child: Stack(
              children: [
                Center(child: Text('2022',style: TextStyle(color: Color.fromARGB(117, 255, 82, 82),fontSize: 60),)),
                ListView.builder(
                    controller: scMonth,
                    scrollDirection: Axis.horizontal,
                    itemCount: ym.month.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MonthWidget(
                        name: ym.month[index],
                        upd: upd,
                      );
                    }),
                    
              ],
            ),
          )
        ],
      ),
    );
  }
}
