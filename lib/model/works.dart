import 'package:cloud_firestore/cloud_firestore.dart';

class WorkResponse {
  String title;
  String name;
  String category;

  WorkResponse.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data);

  WorkResponse.fromMap(Map<String, dynamic> map) {
    this.title = map['title'];
    this.name = map['name'];
    this.category = map['category'];
  }
}
