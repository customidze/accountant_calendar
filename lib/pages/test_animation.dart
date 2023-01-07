import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class TestAnimation extends StatelessWidget {
  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: ProgessIndicator(radius: 150,),
          //child: CirculalProgressIndicatorCustom(),
          // height: MediaQuery.of(context).size.width,
          // width: MediaQuery.of(context).size.width,
          //color: Colors.black,
          //padding: EdgeInsets.all(30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.abc),
        onPressed: () {
          //aController.repeat();
        },
      ),
    );
  }
}

class DemoWidget extends StatefulWidget {
  @override
  _DemoWidgetState createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat()
          ..addListener(() {
            setState(() {});
          });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ProgressPainter(
          0.0, _controller.value * math.pi * 2, _controller.value),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double _arcStart;
  final double _arcSweep;
  final double progress;

  ProgressPainter(this._arcStart, this._arcSweep, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final angle = 360.0 * progress;

    num degToRad(num deg) => deg * (math.pi / 180.0);
    final Offset offsetCenter = Offset(size.height / 2, size.width / 2);
    double radius = 70;
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    //final Rect arcRect = Rect.fromCircle(center: offsetCenter, radius: drawRadius);
    final Gradient gradient = SweepGradient(
      // startAngle: 0,
      // endAngle: 5.0,
      colors: [
        Colors.white,
        Colors.black,
      ],
    );

    Rect oval = Rect.fromCircle(center: offsetCenter, radius: radius);

    // oval.set(centerX - radius, centerY - radius, centerX + radius,
    //  centerY + radius);

    double side = math.min(size.width, size.height);

    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 15.0
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(oval);

    Paint paintFont = Paint()
      ..color = Colors.white
      //..strokeCap = StrokeCap.round
      ..strokeWidth = 15.0
      ..style = PaintingStyle.stroke;

    // canvas.drawArc(
    //     Offset.zero & Size(side, side), _arcStart, _arcSweep, false, paint);
    canvas.drawCircle(offsetCenter, radius, paintFont);

    //canvas.drawArc(oval, _arcStart, _arcSweep, false, paint);
    canvas.drawArc(oval, _arcStart, degToRad(angle) - _arcStart, false, paint);
  }

  @override
  bool shouldRepaint(ProgressPainter other) {
    return _arcStart != other._arcStart || _arcSweep != other._arcSweep;
  }
}

class ProgessIndicator extends StatefulWidget {
  const ProgessIndicator({super.key, required this.radius});
  final double radius;

  @override
  State<ProgessIndicator> createState() => _ProgessIndicatorState();
}

class _ProgessIndicatorState extends State<ProgessIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
      child: GradientCircularProgressIndicator(
        radius: widget.radius,
        gradientColors: [
          Colors.white,
          Colors.black,
        ],
        strokeWidth: 10.0,
      ),
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  const GradientCircularProgressIndicator({
    required this.radius,
    required this.gradientColors,
    this.strokeWidth = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: GradientCircularProgressPainter(
        radius: radius,
        gradientColors: gradientColors,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader = SweepGradient(
            colors: gradientColors, startAngle: 0.0, endAngle: 2 * math.pi)
        .createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * math.pi, false, paint);

    Paint dotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(radius*2-strokeWidth/2, radius), Offset(radius*2-strokeWidth/2, radius), dotPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
