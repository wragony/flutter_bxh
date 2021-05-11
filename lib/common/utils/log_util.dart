import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class LogUtil {
  static void v(dynamic message) {
    logger.v(message);
  }

  static void d(dynamic message) {
    logger.d(message);
  }

  static void i(dynamic message) {
    logger.i(message);
  }

  static void w(dynamic message) {
    logger.w(message);
  }

  static void e(dynamic message) {
    logger.e(message);
  }
}
