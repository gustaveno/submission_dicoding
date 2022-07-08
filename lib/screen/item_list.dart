import 'package:flutter/material.dart';
import 'package:submission_dicoding/screen/product_screen.dart';
import 'package:submission_dicoding/service/database.dart';
import 'package:submission_dicoding/model/place.dart';

class ItemList extends StatefulWidget {
  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
            left: 40,
          ),
          child: Text(
            "Find your \nnext vacation.",
            style: TextStyle(
              letterSpacing: 1.3,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              height: 1.3,
            ),
          ),
        ),
        SizedBox(
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
                            color: Colors.white,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Stack(
                              children: [
                                Ink.image(
                                  image: AssetImage(place.image),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Color.fromARGB(157, 150, 150, 150),
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
    );
  }
}
