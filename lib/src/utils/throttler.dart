import 'dart:async';

import 'package:flutter/material.dart';

class Throttler {
  Throttler([
    this.duration = const Duration(milliseconds: 500),
  ]);

  Timer? _timer;
  bool _isThrottled = false;
  final Duration duration;

  void run(VoidCallback action) {
    if (!_isThrottled) {
      action();
      _isThrottled = true;
      _timer = Timer(duration, () {
        _isThrottled = false;
      });
    }
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
