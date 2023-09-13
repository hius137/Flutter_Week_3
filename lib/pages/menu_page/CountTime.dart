import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountTime extends StatefulWidget {
  final DateTime time;

  const CountTime({super.key, required this.time});

  @override
  State<CountTime> createState() => _CountTimeState();
}

class _CountTimeState extends State<CountTime> {
  Timer? currentSTime;
  int secondCity = 0;
  int minuteCity = 0;
  int hourCity = 0;

  @override
  void initState() {
    super.initState();
    count();
  }

  @override
  void dispose() {
    currentSTime?.cancel();
    super.dispose();
  }

  void count() {
    secondCity = widget.time.second;
    minuteCity = widget.time.minute;
    hourCity = widget.time.hour;

    currentSTime = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (context.mounted) {
        setState(() {
          secondCity = secondCity + 1;
          if (secondCity == 60) {
            secondCity = 0;
            minuteCity = minuteCity + 1;
            if (minuteCity == 60) {
              minuteCity = 0;
              hourCity = hourCity + 1;
              if (hourCity == 24) {
                hourCity = 0;
                secondCity + 1;
              }
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$hourCity:$minuteCity:${secondCity <= 9 ? '0$secondCity' : secondCity}',
      style: GoogleFonts.jura(
        letterSpacing: 3,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
