import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:client/features/chats/models/chat_message_model.dart';
import 'package:client/features/chats/repo/chat_repo.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBlocBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  ChatBlocBloc() : super(ChatBlocInitial()) {
    on<ChatNewPromptEvent>(chatNewPromptEvent);
    on<ChatContentGeneratedEvent>(chatContentGeneratedEvent);
  }

  StreamSubscription<http.Response>? _subscription;
  List<ChatMessageModel> cachedMessage = [];
  FutureOr<void> chatNewPromptEvent(
      ChatNewPromptEvent event, Emitter<ChatBlocState> emit) {
    emit(ChatNewMessageGeneratingLoadingState());

    try {
      ChatMessageModel newMessage =
          ChatMessageModel(role: "user", content: event.prompt);
      cachedMessage.add(newMessage);
      emit(ChatNewMessageGeneratingSuccessState());
      cachedMessage.add(ChatMessageModel(role: "assistance", content: ""));
      _subscription?.cancel();
      _subscription = getChatGptRespnseRepo(cachedMessage).listen((response) {
        log(response as num).toString();
        for (String line in response.body.split('\n')) {
          String jsonDataString = line.replaceFirst("data :", "");
          Map<String, dynamic> data = jsonDecode(jsonDataString.trim());
          add(ChatContentGeneratedEvent(content: data['data']));
        }
      });
    } catch (e) {
      emit(ChatNewMessageGeneratingErrorState());
    }
  }

  FutureOr<void> chatContentGeneratedEvent(
      ChatContentGeneratedEvent event, Emitter<ChatBlocState> emit) {
    ChatMessageModel modelMessage = cachedMessage.last;
    String content = event.content;
    cachedMessage.last = ChatMessageModel(
        role: "assistance", content: modelMessage.content + content);
    emit(ChatNewMessageGeneratingSuccessState());
  }
}
