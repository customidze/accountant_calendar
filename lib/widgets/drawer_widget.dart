import 'package:accountant_calendar/pages/about_page.dart';
import 'package:accountant_calendar/pages/test_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Center(
            child: Text('Настройки'),
          )),
           ListTile(
              title: Text('О нас'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              }),
              ListTile(
              title: Text('testAnimation'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestAnimation()));
              }),
        ],
      ),
    );
  }
}
