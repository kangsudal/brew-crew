import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid }); 

  //collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection("brews");

  Future updateUserData(String sugar, String name, String strength) async {
    return await brewCollection.document(uid).setData({
      "sugar": sugar,
      "name": name,
      "strength": strength,
    });
  }

  Stream<QuerySnapshot> get brews{
    // cloud firestore에 저장된 모든 member를 불러오는 데이터
    return brewCollection.snapshots();
  }
}
