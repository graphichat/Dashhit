part of message_bloc;

@immutable
abstract class MessageState {}

class IdleS extends MessageState {}

class MessageSendingS extends MessageState {}

class MessageSentS extends MessageState {}

class MessageSendFailed extends MessageState {}
