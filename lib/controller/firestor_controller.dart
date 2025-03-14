import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lesson6/model/photomemo.dart';

const photoMemoCollection = 'photomemo_collection';

Future<String> addPhotoMemo({required PhotoMemo photoMemo}) async {
  DocumentReference ref = await FirebaseFirestore.instance
      .collection(photoMemoCollection)
      .add(photoMemo.toFirestoreDoc());
  return ref.id;
}
