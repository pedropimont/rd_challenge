import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context, [String? message]) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          content: _loadingIndicator(context, message),
        ),
      );
    },
  );
}

Widget _loadingIndicator(BuildContext context, [String? message]) {
  return Container(
    padding: const EdgeInsets.all(0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _getLoadingIndicator(),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            'Please wait …',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        if (message != null)
          Text(
            message,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
      ],
    ),
  );
}

Widget _getLoadingIndicator() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: SizedBox(
      width: 32,
      height: 32,
      child: CircularProgressIndicator(strokeWidth: 3),
    ),
  );
}
