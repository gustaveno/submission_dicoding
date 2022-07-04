import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/data_plant.dart';
import 'package:submission_dicoding/screen/chart_screen.dart';
import 'package:submission_dicoding/screen/product_screen.dart';
import 'package:submission_dicoding/screen/chart_screen.dart';
import 'package:provider/provider.dart';
import 'package:submission_dicoding/service/database.dart';
import 'package:submission_dicoding/screen/item_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          'Travelin Aja',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 115, 92),
              fontFamily: 'Lato',
              fontWeight: FontWeight.w900,
              fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChartScreen();
              }));
            },
          ),
        ],
      ),
      body: PageView(
        pageSnapping: false,
        scrollDirection: Axis.vertical,
        children: [BestList()],
      ),
    );
  }
}
