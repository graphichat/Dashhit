import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String documentId;

  /// This can be one of the following
  ///   * image - Priority
  ///   * text
  ///   * video
  ///   * voice
  String type;
  DateTime messagedOn;
  MessagedBy messagedBy;
  ImageMessage data;

  Message.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final snapData = snapshot.data;
    documentId = snapshot.documentID;
    type = snapData['type'];
    messagedOn = snapData['messagedOn'];
    messagedBy = MessagedBy.fromMapData(snapData['messagedBy']);
    data = ImageMessage.fromMapData(snapData['data']);
  }
}

class MessagedBy {
  String photoUrl;
  String name;
  String email;

  MessagedBy.fromMapData(Map data) {
    photoUrl = data['photoUrl'];
    name = data['name'];
    email = data['email'];
  }
}

class ImageMessage {
  String downloadUrl;
  String storagePath;

  ImageMessage.fromMapData(Map data) {
    downloadUrl = data['downloadUrl'];
    storagePath = data['storagePath'];
  }
}
