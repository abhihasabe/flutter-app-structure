import 'package:flutter/material.dart';

class DialogHelper {

  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child:CircularProgressIndicator(
              ),
            ),
          );
        });
  }

  static void dismissDialog(BuildContext context){
    Navigator?.of(context, rootNavigator: true).pop();
  }

  static Widget showSnackbars(String text) {
    return SnackBar(
      content: Text(
        '$text',
        style: TextStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog

    });
  }
}