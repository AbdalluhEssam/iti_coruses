import 'dart:developer' as log;

import 'package:flutter/foundation.dart';

class LogManager {
  LogManager._();

  static logToConsole(Object? data, {String? title = "log:"}) {
    if (kDebugMode) {
      log.log(data.toString(), name: title ?? "");
      debugPrint("$title ${data.toString()}");
    }
  }
}
