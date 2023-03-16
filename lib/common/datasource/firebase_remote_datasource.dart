import 'package:firebase_database/firebase_database.dart';

abstract class FirebaseRemoteDataSource {}

class RemoteDataSource implements FirebaseRemoteDataSource {
  DatabaseReference lessonsRef = FirebaseDatabase.instance.ref('lessons');

  void myMethod() async {
    final response = await lessonsRef.get();
    print(response.value);
  }
}
