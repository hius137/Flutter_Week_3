import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:project_2/utils/app_image.dart';
import 'dart:convert' as convert;

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage>
    with AutomaticKeepAliveClientMixin {
  String timeCity = "";
  String dayCity = "";
  String gmt = "";
  String nameCity = "";

  void printCurrentTimeEverySecond() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) async {
      //http
      var val =
          Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Ho_Chi_Minh");
      var response = await get(val);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var dateAndTime = jsonResponse["datetime"];
      var uc_offset = jsonResponse['utc_offset'].toString().substring(1, 3);
      var utc_offset = jsonResponse["utc_offset"];
      var timezone = jsonResponse["timezone"];
      int viTriDauGach = timezone.toString().indexOf("/");
      String timezonename = viTriDauGach != -1 ? timezone.toString().substring(viTriDauGach + 1).replaceAll('_', " ") : "";

      DateTime time = DateTime.parse(dateAndTime);
      time = time.add(Duration(hours: int.parse(uc_offset)));

      setState(() {
        timeCity = DateFormat.Hms().format(time);
        dayCity = DateFormat('dd/MM/yyyy').format(time);
        gmt = utc_offset.toString();
        nameCity = timezonename;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    printCurrentTimeEverySecond();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                    Text(
                      'GMT:$gmt',
                      style: GoogleFonts.jura(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      timeCity,
                      style: GoogleFonts.jura(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      dayCity,
                      style: GoogleFonts.jura(
                        fontSize:20,
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
