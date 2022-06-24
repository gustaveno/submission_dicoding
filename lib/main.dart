import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:submission_dicoding/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelin Aja',
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
              'Travelin Aja',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 115, 92),
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
                  primary: Color.fromARGB(255, 255, 115, 92),
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
