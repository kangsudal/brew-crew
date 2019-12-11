import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection("brews");

  Future updateUserData(String sugar, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      "sugar": sugar,
      "name": name,
      "strength": strength,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
          name: doc.data['name'] ?? '',
          sugar: doc.data['sugar'] ?? '0',
          strength: doc.data['strength'] ?? 0);
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data["sugars"],
      strength: snapshot.data["strength"],
    );
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    // cloud firestore에 저장된 모든 member를 불러오는 데이터
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
