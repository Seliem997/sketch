import 'package:flutter/material.dart';
import 'package:sketch/ui/widgets/text_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: TextWidget(text: 'Chat with third party Screen', textSize: 20, color: Colors.white,),
      ),
    );
  }
}
