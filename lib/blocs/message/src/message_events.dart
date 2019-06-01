part of message_bloc;

@immutable
abstract class MessageEvent {}

class SendImageMessageE extends MessageEvent {
  final File file;

  ///Send Image file to the cloud
  SendImageMessageE(this.file)
      : assert(file != null, 'File should not be null');
}
