import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:project_2/model/TimeModel.dart';
import 'dart:convert' as convert;
import 'package:project_2/pages/menu_page/CountTime.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomListView();
  }
}

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List<TimeModel> listCityTime = [];

  @override
  void initState() {
    super.initState();
    printCurrentTime();
  }

  void printCurrentTime() {
    getTime('Asia/Ho_Chi_Minh');
    getTime('America/New_York');
    getTime('Asia/Hong_Kong');
    getTime('Europe/London');
    getTime('Europe/Berlin');
    getTime('Asia/Tokyo');
    getTime('Europe/Moscow');
  }

  Future<void> getTime(String uri) async {
    var val = Uri.parse("http://worldtimeapi.org/api/timezone/$uri");
    var response = await get(val);
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var dateAndTime = jsonResponse["datetime"];
    var ucOffset = jsonResponse['utc_offset'].toString().substring(1, 3);
    var timezone = jsonResponse["timezone"];
    var utcOffset = jsonResponse["utc_offset"];
    int slash = timezone.toString().indexOf("/");
    String timezonename = slash != -1
        ? timezone.toString().substring(slash + 1).replaceAll('_', " ")
        : "";
    DateTime time = DateTime.parse(dateAndTime);
    time = time.add(Duration(hours: int.parse(ucOffset)));

    String timeCity = DateFormat.Hms().format(time); // 'hh//mm//ss'
    String dayCity = DateFormat('dd/MM/yyyy').format(time);
    String nameCity = timezonename;
    String gmtCity = utcOffset.toString();

    setState(() {
      listCityTime.add(TimeModel(
        clockTime: timeCity,
        dayTime: dayCity,
        cityName: nameCity,
        gmt: gmtCity,
        timeCity: time,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
              padding: const EdgeInsets.all(2.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CountTime(time: listCityTime[index].timeCity),
                      Text(
                        listCityTime[index].dayTime ?? "",
                        style: GoogleFonts.jura(
                          letterSpacing: 2,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
