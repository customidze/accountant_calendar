import 'package:accountant_calendar/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Circ extends StatefulWidget {
  
  
  
  

  @override
  State<Circ> createState() => _CircState();
}

class _CircState extends State<Circ> with TickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  Tween<double> _rotationTween = Tween(begin: 10, end: 100);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    animation = _rotationTween.animate(controller!)
    ..addListener(() {
      MainPage.of(context)!.setState(() {
        
      });
      
      //print('rrr');
      //setState(() {});
      // widget.upd.setState(() {
        
      // });
      
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('object');
        controller!.repeat();
      } else if (status == AnimationStatus.dismissed) {
        print('object111');
        controller!.forward();
      }
    });
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, snapshot) {
        return CustomPaint(
         //child: Container(height: 40, width: 40),
         painter: Line(length: animation!.value),
       );
      },
      // child: CustomPaint(
      //   child: Container(height: 40, width: 40),
      //   painter: Line(),
      // ),
    );
  }
}

class Line extends CustomPainter {
  final double length;
  Line({required this.length});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 30, 46, 136)
      //..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      //..strokeJoin = StrokeJoin.round
      ..strokeWidth = 5;

    // Offset startingPoint = Offset(0, size.height / 2);
    // Offset endingPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(Offset(length, length+10), Offset(length, length+10), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
