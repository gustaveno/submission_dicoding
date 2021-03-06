import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/data_plant.dart';

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'My Chart',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                fontSize: 24),
          ),
        ),
        body: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Row(
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          image: new DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: new AssetImage('images/gambar1.jpg'),
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
                          'Ficus Altissima',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('228')
                      ],
                    ),
                  ),
                )
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
        color: (isFavorite) ? Color.fromARGB(255, 32, 178, 93) : Colors.black,
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
