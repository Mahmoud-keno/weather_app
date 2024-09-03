import 'package:flutter/material.dart';
import 'package:weather_app/pages/pagesearch.dart';

class Errorsearch extends StatelessWidget {
  const Errorsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    }))
          ]),
      body: Center(
        child: Container(
          height: 350,
          width: 350,
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.only(bottom: 70),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/location-off.png',
                  height: 150,
                  width: 150,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(children: [
                    Text('No Search Available',
                        style:
                            TextStyle(fontFamily: 'Bebas Neue', fontSize: 18)),
                    Text('Please Search again Correctly',
                        style:
                            TextStyle(fontFamily: 'Bebas Neue', fontSize: 18))
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
