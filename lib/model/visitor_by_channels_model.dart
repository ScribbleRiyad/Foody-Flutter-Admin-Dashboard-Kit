import 'dart:convert';

import 'package:foody/helpers/services/json_decoder.dart';
import 'package:foody/model/identifier_model.dart';
import 'package:flutter/services.dart';

class VisitorByChannelsModel extends IdentifierModel {
  final String channel;
  final int session, targetReached;
  final double bounceRate, pagePerSession;
  final DateTime sessionDuration;

  VisitorByChannelsModel(super.id, this.channel, this.session, this.targetReached, this.bounceRate, this.pagePerSession, this.sessionDuration);

  static VisitorByChannelsModel fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String channel = decoder.getString('channel');
    int session = decoder.getInt('session');
    int targetReached = decoder.getInt('target_reached');
    double bounceRate = decoder.getDouble('bounce_rate');
    double pagePerSession = decoder.getDouble('page_per_session');
    DateTime sessionDuration = decoder.getDateTime('session_duration');

    return VisitorByChannelsModel(decoder.getId, channel, session, targetReached, bounceRate, pagePerSession, sessionDuration);
  }

  static List<VisitorByChannelsModel> listFromJSON(List<dynamic> list) {
    return list.map((e) => VisitorByChannelsModel.fromJSON(e)).toList();
  }

  static List<VisitorByChannelsModel>? _dummyList;

  static Future<List<VisitorByChannelsModel>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/visitors_by_channels_data.json');
  }
}
