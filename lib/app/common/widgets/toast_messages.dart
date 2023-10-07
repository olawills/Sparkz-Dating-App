import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/core.dart';

import '../../core/network/dio_exception.dart';

class ToastMessages {
  static final ToastMessages _instance = ToastMessages._internal();

  factory ToastMessages() => _instance;

  ToastMessages._internal();

  showToastServerError(NetworkExceptions error) {
    Fluttertoast.showToast(
        msg: NetworkExceptions.getErrorMessage(error),
        fontSize: 16,
        backgroundColor: Color(kDarkRed.value),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  showToastSuccessMessage(String message) {
    return Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(kDarkRed.value),
    );
  }

  showToastErrorMessage(String message) {
    return Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(kDarkRed.value),
    );
  }
}
