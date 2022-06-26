import 'package:submission_dicoding/model/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference
  final CollectionReference placeCollection =
      FirebaseFirestore.instance.collection('places');

  List<Place> _placeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Place(
        name: doc.get('name') ?? '',
        description: doc.get('description') ?? '',
        price: doc.get('price') ?? '',
        location: doc.get('location') ?? '',
        image: doc.get('image') ?? '',
      );
    }).toList();
  }

  Stream<List<Place>> readPlaces() => FirebaseFirestore.instance
      .collection('places')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Place.fromJson(doc.data())).toList());
}
