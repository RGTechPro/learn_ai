import 'package:flutter/cupertino.dart';

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
import 'package:provider/provider.dart';

class ChatP extends ChangeNotifier {
  final user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  List<types.Message> messages = [];

  void addMessage(types.Message message) {
    messages.insert(0, message);
    notifyListeners();
  }

  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    addMessage(textMessage);
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}
