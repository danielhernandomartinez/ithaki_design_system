import 'dart:async';
import 'package:flutter/material.dart';

/// A mixin for StatefulWidgets that need a countdown timer.
/// Provides: countdownSeconds, countdownCanResend, startCountdown(), stopCountdown()
/// Automatically calls setState on each tick.
mixin CountdownMixin<T extends StatefulWidget> on State<T> {
  int countdownSeconds = 24;
  bool countdownCanResend = false;
  Timer? _countdownTimer;

  void startCountdown([int seconds = 24]) {
    countdownSeconds = seconds;
    countdownCanResend = false;
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (countdownSeconds > 0) {
          countdownSeconds--;
        } else {
          countdownCanResend = true;
          timer.cancel();
        }
      });
    });
  }

  void stopCountdown() {
    _countdownTimer?.cancel();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }
}
