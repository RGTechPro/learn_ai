import 'dart:convert';
import 'dart:math';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:learn_ai/provider/chat.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final _secondUser = const types.User(id: 'jhvhvhv');
  final List<types.Message> _messages = [];
  @override
  Widget build(BuildContext context) {
    //  types.CustomMessage()
    final provider = Provider.of<ChatP>(context, listen: true);
    provider.messages.insert(
        0,
        types.TextMessage(
            text:
                "Hi Peter, I'm Olivia! I am your new Class Colleague. Let's talk about your class experience today, how was the class?",
            id: randomString(),
            createdAt: DateTime.now().millisecondsSinceEpoch,
            author: _secondUser));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF4F4F4),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
                  CircleAvatar(
                    backgroundColor: Color(0xffF4F4F4),
                    radius: 35,
                    backgroundImage: AssetImage(
                      'assets/edu.png',
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
                ],
              ),
            ),
            Expanded(
              child: Chat(
                  bubbleBuilder: _bubbleBuilder,
                  showUserNames: true,
                  messages: provider.messages,
                  onSendPressed: provider.handleSendPressed,
                  user: provider.user),
            )
          ],
        ),
      ),
    );
  }

  Widget _bubbleBuilder(
    Widget child, {
    required message,
    required nextMessageInGroup,
  }) =>
      Bubble(
        child: Column(
          children: [
            Text(
                "Hi Peter, I'm Olivia! I am your new Class Colleague. Let's talk about your class experience today, how was the class?",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 20,
                ))),
            SizedBox(
              height: 10,
            ),
            MyRadio()
          ],
        ),
        color: _user.id != message.author.id ||
                message.type == types.MessageType.image
            ? const Color(0xfff5f5f7)
            : const Color(0xff6f61e8),
        margin: nextMessageInGroup
            ? const BubbleEdges.symmetric(horizontal: 6)
            : null,
        nip: nextMessageInGroup
            ? BubbleNip.no
            : _user.id != message.author.id
                ? BubbleNip.leftBottom
                : BubbleNip.rightBottom,
      );
}

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

List<String> item = ['Excellent', 'Very Good', 'Good', 'Fair', 'Poor'];
String groupValue = '';

class MyRadio extends StatefulWidget {
  const MyRadio({super.key});

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatP>(context, listen: true);
    return RadioGroup<String>.builder(
      activeColor: Color(0xff5E40A4),
      textStyle: GoogleFonts.lato(
          textStyle: TextStyle(
        fontSize: 15,
      )),
      groupValue: groupValue,
      onChanged: (value) => setState(() {
        groupValue = value!;
        provider.addMessage(
        types.TextMessage(
            text:
                value,
            id: randomString(),
            createdAt: DateTime.now().millisecondsSinceEpoch,
            author: provider.user));
      }
      
      ),
      items: item,
      itemBuilder: (item) => RadioButtonBuilder(
        item,
      ),
    );
  }
}
