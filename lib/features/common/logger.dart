import 'package:logger/logger.dart';

mixin CustomLogger{
  void logInfo(dynamic body){
    final logger = Logger();
    logger.i(body);
  }
}