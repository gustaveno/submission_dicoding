import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/data_plant.dart';

class ProductScreen extends StatelessWidget {
  final DataPlant plant;

  ProductScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return ProductSmall(plant: plant);
  }
}

class ProductSmall extends StatelessWidget {
  final DataPlant plant;

  ProductSmall({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      image: AssetImage(plant.image),
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
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
                      Text(plant.name,
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w900,
                              fontSize: 24.0,
                              color: Colors.black)),
                      RichText(
                        text: TextSpan(
                          text: '\$' + plant.price + '.',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w900,
                              fontSize: 24.0,
                              color: Colors.black),
                          children: const <TextSpan>[
                            TextSpan(
                                text: '00',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                    color: Colors.black)),
                          ],
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
                    plant.description,
                    style: TextStyle(fontFamily: 'lato', fontSize: 13),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Container(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      child: Center(child: ButtonFill()),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700)),
                    ),
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
          color: Color.fromARGB(255, 32, 178, 93),
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
