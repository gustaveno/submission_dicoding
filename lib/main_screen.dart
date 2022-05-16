import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/data_plant.dart';
import 'package:submission_dicoding/product_screen.dart';
import 'package:submission_dicoding/chart_screen.dart';

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
          'Plant & Co',
          style: TextStyle(
              color: Colors.black,
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
        children: [BestList(), PopularList(), NewList()],
      ),
    );
  }
}

class BestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Best Selling',
              style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final DataPlant plant = plantList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductScreen(
                          plant: plant,
                        );
                      }));
                    },
                    child: SizedBox(
                      width: 300,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          children: [
                            Ink.image(
                              image: AssetImage(plant.image),
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 35, left: 30),
                              child: Text(
                                plant.name,
                                style: TextStyle(
                                    fontFamily: 'Lato', fontSize: 22.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 30, left: 32),
                                child: RichText(
                                  text: TextSpan(
                                    text: '\$' + plant.price + '.',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22.0,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: '00',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.0,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                  );
                },
                itemCount: plantList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Popular',
              style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final DataPlant plant = plantList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductScreen(
                          plant: plant,
                        );
                      }));
                    },
                    child: SizedBox(
                      width: 300,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          children: [
                            Ink.image(
                              image: AssetImage(plant.image),
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 35, left: 30),
                              child: Text(
                                plant.name,
                                style: TextStyle(
                                    fontFamily: 'Lato', fontSize: 22.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 30, left: 32),
                                child: RichText(
                                  text: TextSpan(
                                    text: plant.price + '.',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22.0,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: '00',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.0,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                  );
                },
                itemCount: plantList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'New',
              style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final DataPlant plant = plantList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductScreen(
                          plant: plant,
                        );
                      }));
                    },
                    child: SizedBox(
                      width: 300,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          children: [
                            Ink.image(
                              image: AssetImage(plant.image),
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 35, left: 30),
                              child: Text(
                                plant.name,
                                style: TextStyle(
                                    fontFamily: 'Lato', fontSize: 22.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 30, left: 32),
                                child: RichText(
                                  text: TextSpan(
                                    text: plant.price + '.',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22.0,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: '00',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.0,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                  );
                },
                itemCount: plantList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
