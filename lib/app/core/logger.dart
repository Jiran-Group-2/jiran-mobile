import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// It will double check with the Flutter's [log] statement
/// based on [kDebugMode]. <- Hover on this word to see the elaboration
var logger = Logger();

appLogger(Object? object, {String? name}) {
  if (kDebugMode) {
    // log(object.toString(), name: name ?? "log");
    // debugPrint('[$name] ${object.toString()}');
    logger.d('[$name] ${object.toString()}');
  }
}
