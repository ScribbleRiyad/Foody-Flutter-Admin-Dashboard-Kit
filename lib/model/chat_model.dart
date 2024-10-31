import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foody/helpers/services/json_decoder.dart';
import 'package:foody/images.dart';
import 'package:foody/model/identifier_model.dart';

class Chat extends IdentifierModel {
  final String firstName, message, sendMessage, receiveMessage, image;
  final DateTime sendAt;
  bool fromMe = true;
  bool active = true;

  Chat(super.id, this.firstName, this.message, this.sendAt, this.sendMessage,
      this.receiveMessage, this.fromMe, this.active, this.image);

  static Chat fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String firstName = decoder.getString('first_name');
    String message = decoder.getString('message');
    DateTime sendAt = decoder.getDateTime('send_at');
    String sendMessage = decoder.getString('send_message');
    String receiveMessage = decoder.getString('receive_message');
    bool fromMe = decoder.getBool('from_me');
    bool active = decoder.getBool('active');
    String image = Images.randomImage(Images.avatars);

    return Chat(decoder.getId, firstName, message, sendAt, sendMessage,
        receiveMessage, fromMe, active, image);
  }

  static List<Chat> listFromJSON(List<dynamic> list) {
    return list.map((e) => Chat.fromJSON(e)).toList();
  }

  static List<Chat>? _dummyList;

  static Future<List<Chat>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 10);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/chat_data.json');
  }
}
