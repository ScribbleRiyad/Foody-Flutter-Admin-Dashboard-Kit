import 'dart:async';

import 'package:foody/views/my_controller.dart';

class ComingSoonController extends MyController {
  Timer? countdownTimer;
  Duration myDuration = Duration(days: 8);

  void setCountDown() {
    final reduceSecondsBy = 1;
    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds >= 0) {
      myDuration = Duration(seconds: seconds);
    }
    update();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
}
