import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:submission_dicoding/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bean n Co',
      theme: ThemeData(),
      home: LandingScreen(),
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Plant & Co',
              style: TextStyle(
                  color: Color.fromARGB(255, 32, 178, 93),
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w900,
                  fontSize: 36),
            ),
            SizedBox(
              height: 24,
            ),
            Image.asset('images/1.png', width: 200, height: 200),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
                child: Text('Get Started'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 32, 178, 93),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  fixedSize: Size(180, 40),
                ),
                onPressed: () {
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainScreen();
                    }));
                  }
                  ;
                }),
          ],
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
