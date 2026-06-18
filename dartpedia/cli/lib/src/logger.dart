import 'dart:io';
import 'package:logging/logging.dart';

Logger initFileLogger(String name) {
  // Enables logging from child loggers.
  hierarchicalLoggingEnabled = true;

  // Create a logger instance with the provided name.
  final logger = Logger(name);
  final now = DateTime.now();

  // The rest of the function will be added below.
  // ...

  return logger;
}

