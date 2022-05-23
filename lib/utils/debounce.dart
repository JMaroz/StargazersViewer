import 'package:flutter/foundation.dart';
import 'dart:async';

class Debounce {
  final int milliseconds;
  Timer? _timer;

  Debounce({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel(); // You can comment-out this line if you want. I am not sure if this call brings any value.
    _timer = null;
  }
}