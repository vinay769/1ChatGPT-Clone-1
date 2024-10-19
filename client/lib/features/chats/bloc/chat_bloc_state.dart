part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocState {}

final class ChatBlocInitial extends ChatBlocState {}

class ChatNewMessageGeneratingLoadingState extends ChatBlocState {}

class ChatNewMessageGeneratingErrorState extends ChatBlocState {}

class ChatNewMessageGeneratingSuccessState extends ChatBlocState {}
