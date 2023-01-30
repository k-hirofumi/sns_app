import 'package:flutter/material.dart';

class NetworkUnexpectErrorDialog extends StatelessWidget {
  const NetworkUnexpectErrorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('通信に失敗しました。'),
      content: const Text('お手数ですが、運営までご連絡ください'),
      actions: <Widget>[
        GestureDetector(
          child: const Text('はい'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        // GestureDetector(
        //   child: Text('はい'),
        //   onTap: () {},
        // )
      ],
    );
  }
}