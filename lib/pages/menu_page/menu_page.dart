import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:project_2/model/time_model.dart';
import 'dart:convert' as convert;

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return CustomListView();
  }
}

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List<TimeModel> listCityTime = [];

  void printCurrentTimeEverySecond() {
    getTime('Asia/Ho_Chi_Minh');
    getTime('America/New_York');
    getTime('Asia/Hong_Kong');
    getTime('Europe/London');
    getTime('Europe/Berlin');
    getTime('Asia/Tokyo');
    getTime('Europe/Moscow');
  }

  @override
  void initState() {
    super.initState();
    printCurrentTimeEverySecond();
  }

  Future<void> getTime(String uri) async {
    var val = Uri.parse("http://worldtimeapi.org/api/timezone/$uri");
    var response = await get(val);
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var dateAndTime = jsonResponse["datetime"];
    var uc_offset = jsonResponse['utc_offset'].toString().substring(1, 3);
    var timezone = jsonResponse["timezone"];
    var utc_offset = jsonResponse["utc_offset"];
    int viTriDauGach = timezone.toString().indexOf("/");
    String timezonename = viTriDauGach != -1
        ? timezone.toString().substring(viTriDauGach + 1).replaceAll('_', " ")
        : "";

    DateTime time = DateTime.parse(dateAndTime);
    time = time.add(Duration(hours: int.parse(uc_offset)));

    String timeCity = DateFormat.Hms().format(time);
    String dayCity = DateFormat('dd/MM/yyyy').format(time);
    String nameCity = timezonename;
    String gmtCity = utc_offset.toString();
    setState(() {
      listCityTime.add(TimeModel(
          clockTime: timeCity,
          dayTime: dayCity,
          cityName: nameCity,
          gmt: gmtCity));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listCityTime.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.01,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listCityTime[index].cityName ?? "",
                          style: GoogleFonts.jura(
                            letterSpacing: 3,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'GMT: ${listCityTime[index].gmt}' ?? "",
                          style: GoogleFonts.jura(
                            fontSize: 18,
                            letterSpacing: 1,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listCityTime[index].clockTime ?? "",
                          style: GoogleFonts.jura(
                            letterSpacing: 3,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          listCityTime[index].dayTime ?? "",
                          style: GoogleFonts.jura(
                            letterSpacing: 2,
                            fontSize: 18,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
