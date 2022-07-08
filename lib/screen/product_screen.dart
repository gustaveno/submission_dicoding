import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/place.dart';

class ProductScreen extends StatelessWidget {
  final Place place;

  ProductScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return ProductSmall(place: place);
  }
}

class ProductSmall extends StatelessWidget {
  final Place place;

  ProductSmall({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: kToolbarHeight, //set your height here
          width: double.maxFinite, //set your width here
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: kToolbarHeight,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    child: Center(child: ButtonFill()),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(200, 255, 114, 92),
                        textStyle: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700))),
              ),
              //add as many tabs as you want here
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 360,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(place.image),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 254, 254, 254),
                          radius: 22,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 18,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(place.name,
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w900,
                              fontSize: 24.0,
                              color: Colors.black)),
                      RichText(
                        text: TextSpan(
                          text: place.price,
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w900,
                              fontSize: 22.0,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 211, 211, 211))),
                          child: SelectTotal()),
                      Expanded(child: SizedBox())
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Text(
                    'DESCRIPTION',
                    style: TextStyle(
                        fontFamily: 'lato',
                        fontWeight: FontWeight.w900,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    place.description,
                    style: TextStyle(fontFamily: 'lato', fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color.fromARGB(255, 254, 254, 254),
      radius: 22,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Color.fromARGB(255, 255, 115, 92),
          size: 18,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}

class SelectTotal extends StatefulWidget {
  @override
  State<SelectTotal> createState() => _SelectTotalState();
}

class _SelectTotalState extends State<SelectTotal> {
  int _counter = 1;

  void _incrementPlus() {
    setState(() {
      _counter++;
    });
  }

  void _incrementMinus() {
    setState(() {
      if (_counter <= 0) {
        _counter = 0;
      } else {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        IconButton(
          icon: Icon(
            Icons.remove_outlined,
            size: 18,
          ),
          onPressed: () {
            setState(() {
              _incrementMinus();
            });
          },
        ),
        Text(
          '$_counter',
          style: TextStyle(
              fontFamily: 'Lato', fontWeight: FontWeight.w900, fontSize: 18),
        ),
        IconButton(
          icon: Icon(
            Icons.add_outlined,
            size: 18,
          ),
          onPressed: () {
            setState(() {
              _incrementPlus();
            });
          },
        )
      ]),
    );
  }
}

class ButtonFill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_mall_outlined),
        SizedBox(
          width: 10,
        ),
        Text('ADD TO CART')
      ],
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Succesfully added to cart"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
