import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/pages/pagesearch.dart';
import 'package:weather_app/widgts/check.dart';

// ignore: must_be_immutable
class Weatherinformation extends StatefulWidget {
  const Weatherinformation({super.key});

  // ignore: prefer_const_constructors_in_immutables
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Weatherinformation> {
  String formattedDateTime = '';
  String formattedDate = DateFormat('MMMM dd').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      // Get the current time
      DateTime dateTime = DateTime.now();
      // Define the desired timezone
      String timezone =
          BlocProvider.of<GetWeatherCubit>(context).weatherdata.timezone_id;
      // Convert the current time to the desired timezone
      tz.TZDateTime convertedDateTime =
          tz.TZDateTime.from(dateTime, tz.getLocation(timezone));
      // Format the converted time
      formattedDateTime = DateFormat('HH:mm a').format(convertedDateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    var weatherLoadedData =
        BlocProvider.of<GetWeatherCubit>(context).weatherdata;
    // ignore: non_constant_identifier_names
    double chanceofrain = weatherLoadedData.chance_of_rain;

    double chanceofsnow = weatherLoadedData.chance_of_snow;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xffFAFAFB),
          title: const Text(
            'Sky Right',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xff49454F),
              fontFamily: 'Bebas Neue',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.add_location_alt_outlined),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Search();
                  }));
                },
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Check(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                weatherLoadedData.cityname,
                style:  TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto'),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 40,
              endIndent: 300,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                formattedDate,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                formattedDateTime,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 40,
                endIndent: 300,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 30),
                child: Expanded(
                    child: Column(
                  children: [
                    const Text(
                      'Chance for Rain',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                    Text('$chanceofrain%')
                  ],
                )),
              ),
              Expanded(
                  child: Column(
                children: [
                  const Text('Chance for Snow',
                      style: TextStyle(fontFamily: 'Roboto')),
                  Text('$chanceofsnow%')
                ],
              )),
            ])
          ],
        ),
      ),
    );
  }
}
