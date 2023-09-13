import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> with AutomaticKeepAliveClientMixin {
  String dayCity = '';
  String gmt = '';
  String nameCity = '';
  Timer? currentSTime;
  int secondCity = 0;
  int minuteCity = 0;
  int hourCity = 0;

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
    var ucOffset = await jsonResponse['utc_offset'].toString().substring(1, 3);
    var utcOffset = jsonResponse["utc_offset"];
    var timezone = jsonResponse["timezone"];
    int viTriDauGach = timezone.toString().indexOf("/");
    String timezonename = viTriDauGach != -1
        ? timezone.toString().substring(viTriDauGach + 1).replaceAll('_', " ")
        : "";
    DateTime time = DateTime.parse(dateAndTime);
    time = time.add(Duration(hours: int.parse(ucOffset)));

    secondCity = time.second;
    minuteCity = time.minute;
    hourCity = time.hour;
    currentSTime = Timer.periodic(Duration(seconds: 1), (Timer timer) {
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
    });
    dayCity = DateFormat('dd/MM/yyyy').format(time);
    gmt = utcOffset.toString();
    nameCity = timezonename;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          children: [
            Text(
              nameCity,
              style: GoogleFonts.jura(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'GMT:$gmt',
              style: GoogleFonts.jura(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '$hourCity:$minuteCity:${secondCity <= 9 ? '0$secondCity' : secondCity}',
              style: GoogleFonts.jura(
                fontSize: 40,
                fontWeight: FontWeight.bold,
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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
