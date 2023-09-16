import 'package:flutter/material.dart';
import 'dart:ui';

class Dot extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint dot = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    Offset t1 = const Offset(5, 5);
    Offset c1 = const Offset(5, 15);

    canvas.drawPoints(PointMode.points, [t1,c1], dot);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class One extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint line = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset t3 = const Offset(9, 0);
    Offset c3 = const Offset(9, 8);

    Offset t6 = const Offset(9, 10);
    Offset c6 = const Offset(9, 18);

    ///right top
    canvas.drawLine(t3, c3, line);

    ///bottom right
    canvas.drawLine(t6, c6, line);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class Two extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint line = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset t1 = const Offset(2, 1);
    Offset c1 = const Offset(8, 1);

    Offset t3 = const Offset(9, 2);
    Offset c3 = const Offset(9, 8);

    Offset t4 = const Offset(2, 9);
    Offset c4 = const Offset(8, 9);

    Offset t5 = const Offset(1, 10);
    Offset c5 = const Offset(1, 16);

    Offset t7 = const Offset(2, 17);
    Offset c7 = const Offset(8, 17);

    ///top
    canvas.drawLine(t1, c1, line);

    ///right top
    canvas.drawLine(t3, c3, line);

    ///center
    canvas.drawLine(t4, c4, line);

    ///bottom left
    canvas.drawLine(t5, c5, line);

    ///bottom
    canvas.drawLine(t7, c7, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class Three extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint line = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset t1 = const Offset(2, 1);
    Offset c1 = const Offset(8, 1);

    Offset t3 = const Offset(9, 2);
    Offset c3 = const Offset(9, 8);

    Offset t4 = const Offset(2, 9);
    Offset c4 = const Offset(8, 9);

    Offset t6 = const Offset(9, 10);
    Offset c6 = const Offset(9, 16);

    Offset t7 = const Offset(2, 17);
    Offset c7 = const Offset(8, 17);

    ///top
    canvas.drawLine(t1, c1, line);

    ///right top
    canvas.drawLine(t3, c3, line);

    ///center
    canvas.drawLine(t4, c4, line);

    ///bottom right
    canvas.drawLine(t6, c6, line);

    ///bottom
    canvas.drawLine(t7, c7, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class Four extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint line = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset t2 = const Offset(1, 2);
    Offset c2 = const Offset(1, 8);

    Offset t3 = const Offset(9, 2);
    Offset c3 = const Offset(9, 8);

    Offset t4 = const Offset(2, 9);
    Offset c4 = const Offset(8, 9);

    Offset t6 = const Offset(9, 10);
    Offset c6 = const Offset(9, 16);

    ///left top
    canvas.drawLine(t2, c2, line);
    ///right top
    canvas.drawLine(t3, c3, line);

    ///center
    canvas.drawLine(t4, c4, line);

    ///bottom right
    canvas.drawLine(t6, c6, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class Five extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint line = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset t1 = const Offset(2, 1);
    Offset c1 = const Offset(8, 1);

    Offset t2 = const Offset(1, 2);
    Offset c2 = const Offset(1, 8);

    Offset t4 = const Offset(2, 9);
    Offset c4 = const Offset(8, 9);

    Offset t6 = const Offset(9, 10);
    Offset c6 = const Offset(9, 16);

    Offset t7 = const Offset(2, 17);
    Offset c7 = const Offset(8, 17);

    ///top
    canvas.drawLine(t1, c1, line);

    ///left top
    canvas.drawLine(t2, c2, line);

    ///center
    canvas.drawLine(t4, c4, line);

    ///bottom right
    canvas.drawLine(t6, c6, line);

    ///bottom
    canvas.drawLine(t7, c7, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class Six extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint line = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset t1 = const Offset(2, 1);
    Offset c1 = const Offset(8, 1);

    Offset t2 = const Offset(1, 2);
    Offset c2 = const Offset(1, 8);

    Offset t4 = const Offset(2, 9);
    Offset c4 = const Offset(8, 9);

    Offset t5 = const Offset(1, 10);
    Offset c5 = const Offset(1, 16);

    Offset t6 = const Offset(9, 10);
    Offset c6 = const Offset(9, 16);

    Offset t7 = const Offset(2, 17);
    Offset c7 = const Offset(8, 17);

    ///top
    canvas.drawLine(t1, c1, line);

    ///left top
    canvas.drawLine(t2, c2, line);

    ///center
    canvas.drawLine(t4, c4, line);

    ///bottom left
    canvas.drawLine(t5, c5, line);

    ///bottom right
    canvas.drawLine(t6, c6, line);

    ///bottom
    canvas.drawLine(t7, c7, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class Seven extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint line = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset t1 = const Offset(2, 1);
    Offset c1 = const Offset(8, 1);

    Offset t3 = const Offset(9, 2);
    Offset c3 = const Offset(9, 8);

    Offset t6 = const Offset(9, 10);
    Offset c6 = const Offset(9, 16);

    ///top
    canvas.drawLine(t1, c1, line);

    ///right top
    canvas.drawLine(t3, c3, line);

    ///bottom right
    canvas.drawLine(t6, c6, line);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class Eight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint line = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset t1 = const Offset(2, 1);
    Offset c1 = const Offset(8, 1);

    Offset t2 = const Offset(1, 2);
    Offset c2 = const Offset(1, 8);

    Offset t3 = const Offset(9, 2);
    Offset c3 = const Offset(9, 8);

    Offset t4 = const Offset(2, 9);
    Offset c4 = const Offset(8, 9);

    Offset t5 = const Offset(1, 10);
    Offset c5 = const Offset(1, 16);

    Offset t6 = const Offset(9, 10);
    Offset c6 = const Offset(9, 16);

    Offset t7 = const Offset(2, 17);
    Offset c7 = const Offset(8, 17);

    ///top
    canvas.drawLine(t1, c1, line);

    ///left top
    canvas.drawLine(t2, c2, line);

    ///right top
    canvas.drawLine(t3, c3, line);

    ///center
    canvas.drawLine(t4, c4, line);

    ///bottom left
    canvas.drawLine(t5, c5, line);

    ///bottom right
    canvas.drawLine(t6, c6, line);

    ///bottom
    canvas.drawLine(t7, c7, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class Nine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint line = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset t1 = const Offset(2, 1);
    Offset c1 = const Offset(8, 1);

    Offset t2 = const Offset(1, 2);
    Offset c2 = const Offset(1, 8);

    Offset t3 = const Offset(9, 2);
    Offset c3 = const Offset(9, 8);

    Offset t4 = const Offset(2, 9);
    Offset c4 = const Offset(8, 9);

    Offset t6 = const Offset(9, 10);
    Offset c6 = const Offset(9, 16);

    Offset t7 = const Offset(2, 17);
    Offset c7 = const Offset(8, 17);

    ///top
    canvas.drawLine(t1, c1, line);

    ///left top
    canvas.drawLine(t2, c2, line);

    ///right top
    canvas.drawLine(t3, c3, line);

    ///center
    canvas.drawLine(t4, c4, line);

    ///bottom right
    canvas.drawLine(t6, c6, line);

    ///bottom
    canvas.drawLine(t7, c7, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class Zero extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// custom
    final Paint line = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset t1 = const Offset(2, 1);
    Offset c1 = const Offset(8, 1);

    Offset t2 = const Offset(1, 2);
    Offset c2 = const Offset(1, 8);

    Offset t3 = const Offset(9, 2);
    Offset c3 = const Offset(9, 8);

    Offset t5 = const Offset(1, 10);
    Offset c5 = const Offset(1, 16);

    Offset t6 = const Offset(9, 10);
    Offset c6 = const Offset(9, 16);

    Offset t7 = const Offset(2, 17);
    Offset c7 = const Offset(8, 17);

    ///top
    canvas.drawLine(t1, c1, line);

    ///left top
    canvas.drawLine(t2, c2, line);

    ///right top
    canvas.drawLine(t3, c3, line);

    ///bottom left
    canvas.drawLine(t5, c5, line);

    ///bottom right
    canvas.drawLine(t6, c6, line);

    ///bottom
    canvas.drawLine(t7, c7, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
