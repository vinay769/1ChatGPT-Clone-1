import 'dart:ui';

import 'package:client/design/app_colors.dart';
import 'package:client/features/chats/bloc/chat_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreenPage extends StatefulWidget {
  const ChatScreenPage({super.key});

  @override
  State<ChatScreenPage> createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  ChatBlocBloc chatBlocBloc = ChatBlocBloc();

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "ChatGPT",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
          ),
        ),
      ),
      body: BlocConsumer<ChatBlocBloc, ChatBlocState>(
        bloc: chatBlocBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  padding: const EdgeInsets.only(top: 12),
                  itemCount: chatBlocBloc.cachedMessage.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 16, right: 15, bottom: 20, top: 8),
                      decoration: BoxDecoration(
                        color: chatBlocBloc.cachedMessage[index].role ==
                                "assistance"
                            ? AppColors.messageBgColor
                            : Colors.transparent,
                      ),
                      child: Text(chatBlocBloc.cachedMessage[index].content),
                    );
                  },
                )),
                Container(
                  // color: Colors.amberAccent.withOpacity(0.5),
                  height: 120,
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      promptController("Tell me about Nothing , I know all !"),
                      promptController("Tell me about Nothing , I know all !"),
                      promptController("Tell me about Nothing , I know all !"),
                      promptController("Tell me about Nothing , I know all !"),
                      promptController("Tell me about Nothing , I know all !"),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.1)),
                  margin: const EdgeInsets.fromLTRB(16, 6, 16, 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                              hintText: "Ask Anything...",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              filled: false),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.text.isEmpty) {
                            chatBlocBloc.add(
                                ChatNewPromptEvent(prompt: controller.text));
                          }
                        },
                        child: const Icon(Icons.send_rounded),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget promptController(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 200,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(fontSize: 18),
        //"Tell me about Nothing , I know all !"
      )),
    );
  }
}
