part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocEvent {}

class ChatNewPromptEvent extends ChatBlocEvent {
  final String prompt;

  ChatNewPromptEvent({required this.prompt});
}

class ChatContentGeneratedEvent extends ChatBlocEvent {
  final String content;

  ChatContentGeneratedEvent({required this.content});
}
