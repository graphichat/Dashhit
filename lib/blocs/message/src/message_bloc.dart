part of message_bloc;

///This is for sending message and managing states of a message being sent
class MessageBloc extends Bloc<MessageEvent, MessageState> {
  FirebaseApi _firebaseApi;
  @override
  MessageState get initialState => IdleS();
  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if (event is SendImageMessageE) {
      yield MessageSendingS();
      try {
        //Hard coding [messageDatatype]  to image
        await _firebaseApi.sendMessage(
            imageFile: event.file,
            messageDataType: 'image',
            user: AuthApi.user);
        yield MessageSentS();
      } catch (err) {
        yield MessageSendFailed();
      }
    }
  }

  @override
  void onTransition(Transition<MessageEvent, MessageState> transition) {
    print(transition.nextState.runtimeType.toString());
    super.onTransition(transition);
  }
}
