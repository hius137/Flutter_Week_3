import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

import 'package:project_2/Canvas/font_clock.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage>
    with AutomaticKeepAliveClientMixin {
  String dayCity = '';
  String gmt = '';
  String nameCity = '';
  Timer? currentSTime;
  int secondCity = 0;
  int minuteCity = 0;
  int hourCity = 0;
  int second1 = 0;
  int second2 = 0;
  int hour1 = 0;
  int hour2 = 0;
  int minute1 = 0;
  int minute2 = 0;

  @override
  void initState() {
    super.initState();
    printCurrentTimeEverySecond();
  }

  Future<void> printCurrentTimeEverySecond() async {
    //http
    var val =
        Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Ho_Chi_Minh");
    var response = await get(val);
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var dateAndTime = await jsonResponse["datetime"];
    var ucOffset = jsonResponse['utc_offset'].toString().substring(1, 3);
    var utcOffset = jsonResponse["utc_offset"];
    var timezone = jsonResponse["timezone"];
    int deleteindex = timezone.toString().indexOf("/");
    String timezonename = deleteindex != -1
        ? timezone.toString().substring(deleteindex + 1).replaceAll('_', " ")
        : "";
    DateTime time = DateTime.parse(dateAndTime);
    time = time.add(Duration(hours: int.parse(ucOffset)));

    dayCity = DateFormat('dd/MM/yyyy').format(time);
    nameCity = timezonename;
    gmt = utcOffset.toString();
    second2 = time.second ;
    minute2 = time.minute ;
    hour2 = time.hour ;

    currentSTime = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        second2 = second2 + 1;
        if(hour2 >= 10){
          int hou1 = hour2 ~/ 10;
          int hou2 = hour2 % 10;
          hour2 = hou2;
          hour1 = hour1 + hou1;
        }

        if(minute2 >= 10){
          int min1 = minute2 ~/ 10;
          int min2 = minute2 % 10;
          minute2 = min2;
          minute1 = minute1 + min1;
        }

        if(second2 >= 10){
          int sec2 = second2 ~/ 10;
          second2 = 0;
          second1 = second1 + sec2;
          if(second1 >= 6){
            second1 = 0;
            minute2 = minute2 + 1;
            if(minute2 >= 10){
              minute2 = 0;
              minute1 = minute1 + 1;
              if(minute1 >= 6){
                minute1 = 0;
                hour2 = hour2 + 1;
                if(hour2 >= 5){
                  hour2 = 0;
                  hour1 = hour1 + 1;
                  if(hour1 >= 3){
                    hour1 = 0;
                  }
                }
              }
            }
          }
        }
      });
    });
  }

  Widget buildHour (int time){
    switch(time){
      case 0: return CustomPaint(size: const Size(10, 10), painter: Zero());
      case 1: return CustomPaint(size: const Size(10, 10), painter: One());
      case 2: return CustomPaint(size: const Size(10, 10), painter: Two());
      case 3: return CustomPaint(size: const Size(10, 10), painter: Three());
      case 4: return CustomPaint(size: const Size(10, 10), painter: Four());
      case 5: return CustomPaint(size: const Size(10, 10), painter: Five());
      case 6: return CustomPaint(size: const Size(10, 10), painter: Six());
      case 7: return CustomPaint(size: const Size(10, 10), painter: Seven());
      case 8: return CustomPaint(size: const Size(10, 10), painter: Eight());
      case 9: return CustomPaint(size: const Size(10, 10), painter: Nine());
      default: return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  size: const Size(200, 200),
                    painter: ClockPainter()),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              nameCity,
              style: GoogleFonts.jura(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'GMT:$gmt',
              style: GoogleFonts.jura(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: 100,
              height: 40,
              child: StatefulBuilder(
                  builder: (context , state) {
                    return Row(
                        children: [
                          buildHour(hour1),
                          const SizedBox(width: 5),
                          buildHour(hour2),
                          CustomPaint(size: const Size(10, 10), painter: Dot()),
                          buildHour(minute1),
                          const SizedBox(width: 5),
                          buildHour(minute2),
                          CustomPaint(size: const Size(10, 10), painter: Dot()),
                          buildHour(second1),
                          const SizedBox(width: 5),
                          buildHour(second2),
                        ]
                    );
                  }
              ),
            ),
            Text(
              dayCity,
              style: GoogleFonts.jura(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Colors.transparent;

    var outlineBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    var centerFillBrush = Paint()..color = const Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    var minHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.green, Colors.green])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    var hourHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.red, Colors.red])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 90 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }
  @override
  bool shouldRepaint(ClockPainter oldDelegate) {
    return true;
  }
}
