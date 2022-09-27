import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  /// Showing toast without context message
  static void showToast(
    String? text, {
    Color color = Colors.green,
    ToastGravity? toastGravity,
    String? webColor,
  }) {
    if (text == null) return;
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastGravity ?? ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
      webBgColor: webColor,
      webPosition: "center",
      timeInSecForIosWeb: 3,
      fontSize: 14.0,
    );
  }

  /// Remove focus
  static void removeFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  ////Copy text to clipboard
  static void copyToClipBoard(String? text) {
    Clipboard.setData(ClipboardData(text: text ?? ""));
    AppUtils.showToast("Copied to Clipboard");
  }
}
