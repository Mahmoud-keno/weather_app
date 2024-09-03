import 'package:flutter/material.dart';
import 'package:weather_app/pages/pagesearch.dart';

class Noinformation extends StatelessWidget {
  const Noinformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffFFFFFF),
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
              }
              )
              );
            },
            ),
          ),
        ],
      ),
      body: Center(child: Image.asset('assets/images/search-location.png', height: 300, width: 300, )),
    );
  }
}