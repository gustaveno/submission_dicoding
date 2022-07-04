import 'package:flutter/material.dart';
import 'package:submission_dicoding/screen/product_screen.dart';
import 'package:submission_dicoding/service/database.dart';
import 'package:submission_dicoding/model/place.dart';

class BestList extends StatefulWidget {
  @override
  State<BestList> createState() => _BestListState();
}

class _BestListState extends State<BestList> {
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
            child: StreamBuilder<List<Place>>(
                stream: DatabaseService().readPlaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final places = snapshot.data;

                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Place place = places![index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductScreen(
                                place: place,
                              );
                            }));
                          },
                          child: SizedBox(
                            width: 300,
                            child: Card(
                              color: Color.fromARGB(255, 0, 0, 0),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image: AssetImage(place.image),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Color.fromARGB(123, 25, 25, 25),
                                        BlendMode.darken),
                                  ),
                                  Positioned(
                                      bottom: 40,
                                      left: 20,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            place.name,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          Text(
                                            place.location,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                        ],
                                      ))
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
                      itemCount: places?.length,
                    );
                  } else {
                    return Center(
                      child: Text('error'),
                    );
                  }
                }),
          ),
        ],
      ),
    ));
  }
}

class PopularList extends StatefulWidget {
  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
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
            child: StreamBuilder<List<Place>>(
                stream: DatabaseService().readPlaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final places = snapshot.data;

                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Place place = places![index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductScreen(
                                place: place,
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
                                    image: AssetImage(place.image),
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 35, left: 30),
                                    child: Text(
                                      place.name,
                                      style: TextStyle(
                                          fontFamily: 'Lato', fontSize: 22.0),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 30, left: 32),
                                      child: RichText(
                                        text: TextSpan(
                                          text: place.location,
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22.0,
                                              color: Colors.black),
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
                      itemCount: places?.length,
                    );
                  } else {
                    return Center(
                      child: Text('error'),
                    );
                  }
                }),
          ),
        ],
      ),
    ));
  }
}

class NewList extends StatefulWidget {
  @override
  State<NewList> createState() => _NewListState();
}

class _NewListState extends State<NewList> {
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
            child: StreamBuilder<List<Place>>(
                stream: DatabaseService().readPlaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final places = snapshot.data;

                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Place place = places![index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductScreen(
                                place: place,
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
                                    image: AssetImage(place.image),
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 35, left: 30),
                                    child: Text(
                                      place.name,
                                      style: TextStyle(
                                          fontFamily: 'Lato', fontSize: 22.0),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 30, left: 32),
                                      child: RichText(
                                        text: TextSpan(
                                          text: place.location,
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22.0,
                                              color: Colors.black),
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
                      itemCount: places?.length,
                    );
                  } else {
                    return Center(
                      child: Text('error'),
                    );
                  }
                }),
          ),
        ],
      ),
    ));
  }
}
