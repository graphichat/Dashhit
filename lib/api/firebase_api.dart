import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashhit/models/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirebaseApi {
  Future<void> sendMessage(
      {FirebaseUser user, File imageFile, String messageDataType}) async {
    final docRef = Firestore.instance.collection('Messages').document();
    final uploadTask = FirebaseStorage.instance
        .ref()
        .child(docRef.documentID)
        .child('${docRef.documentID}${basename(imageFile.path)}')
        .putFile(imageFile);

    final taskSnapshot = await uploadTask.onComplete;
    final downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return await Firestore.instance
        .collection('Messages')
        .document(docRef.documentID)
        .setData({
      'type': messageDataType,
      'messagedOn': FieldValue.serverTimestamp(),
      'messagedBy': {
        'photoUrl': user.photoUrl,
        'name': user.displayName,
        'email': user.email,
      },
      'data': {
        'downloadUrl': downloadUrl,
        'storagePath': taskSnapshot.storageMetadata.path
      }
    });
  }

  Stream<List<Message>> stream() {
    return Firestore.instance.collection('Messages').snapshots().map(
            (qrySnap) => qrySnap.documents
            .map((docSnap) => Message.fromDocumentSnapshot(docSnap)));
  }
}
