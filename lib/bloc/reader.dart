import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class ReaderBloc {
  final _dartStream = StreamController<String>();
  final _publishStream = PublishSubject<String>();
  final _behaviorStream = BehaviorSubject<String>();
  final _replayStream = ReplaySubject<String>(maxSize: 4);

  //Get
  Stream<String> get dartStream => _dartStream.stream.asBroadcastStream();
  Stream<String> get publishStream => _publishStream.stream;
  Stream<String> get behaviorStream => _behaviorStream.stream;
  Stream<String> get replayStream =>
      _replayStream.stream.map((l) => _replayStream.values.join("\n"));

  startReading() async {
    final temp = await rootBundle.loadString('assets/sonnets.txt');

    final contents = temp.split('\n');

    for (String l in contents) {
      print(l);

      //Add Line to Streams
      _dartStream.sink.add(l);
      _publishStream.add(l);
      _behaviorStream.add(l);
      _replayStream.add(l);

      await Future.delayed(const Duration(milliseconds: 4500));
    }
  }

  dispose() {
    _dartStream.close();
    _publishStream.close();
    _behaviorStream.close();
    _replayStream.close();
  }
}
