import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/data_plant.dart';
import 'package:submission_dicoding/screen/chart_screen.dart';
import 'package:submission_dicoding/screen/item_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: Icon(
                  Icons.navigation,
                  color: Color.fromARGB(255, 255, 115, 92),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChartScreen();
                  }));
                },
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
      ),
      body: ItemList(),
    );
  }
}
