import 'package:flutter/material.dart';
import 'package:submission_dicoding/screen/main_screen.dart';

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          title: Transform(
            transform: Matrix4.translationValues(-45.0, 0.0, 0.0),
            child: Text(
              'My Chart',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
          ),
          actions: [TextButton(onPressed: () {}, child: Text("Hapus semua"))],
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  elevation: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SelectButton(),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 100.0,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      image: new DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: new AssetImage(
                                            'images/gambar2.jpg'),
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Stone Garden',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Rp 15.000')
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SelectButton(),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 100.0,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      image: new DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: new AssetImage(
                                            'images/gambar3.jpg'),
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Kawah Putih',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Rp 40.000')
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(TextSpan(
                                  text: 'Total: ',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'Rp 55.000',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromARGB(255, 255, 115, 92),
                                      ),
                                    )
                                  ])),
                              Container(
                                width: 100,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Center(child: Text('Checkout')),
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(200, 255, 114, 92),
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            height: kToolbarHeight, //set your height here
            width: double.maxFinite, //set your width here
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.navigation),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainScreen();
                    }));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_basket,
                    color: Color.fromARGB(255, 255, 115, 92),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}

class SelectButton extends StatefulWidget {
  @override
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.check_box : Icons.check_box_outline_blank,
        color: (isFavorite) ? Color.fromARGB(255, 255, 115, 92) : Colors.black,
        size: 18,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
