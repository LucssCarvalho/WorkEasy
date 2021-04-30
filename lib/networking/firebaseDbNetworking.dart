import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:WorkEasy/model/works.dart';

class FirebaseDbNetworking {
  final _firestoreCollection = Firestore.instance.collection("trampo");

  Future<List<WorkResponse>> getFirebaseQuestions() async {
    var questions = List<WorkResponse>();

    var firebaseQuestions = await _firestoreCollection.getDocuments();
    firebaseQuestions.documents.forEach((document) {
      var question = new WorkResponse.fromSnapshot(document);

      questions.add(question);
    });

    return questions;
  }
}
