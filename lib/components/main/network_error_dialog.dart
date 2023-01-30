import 'package:flutter/material.dart';

class NetworkErrorDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final bool? okButton;
  late String? okButtonTitle;
  final void Function()? okButtonAction;
  late bool? ngButton = false;
  late String? ngButtonTitle;
  final void Function()? ngButtonAction;
  NetworkErrorDialog({
    Key? key,
    this.title,
    this.content,
    bool? okButton,
    String? okButtonTitle,
    this.okButtonAction,
    bool? ngButton,
    String? ngButtonTitle,
    this.ngButtonAction,
    }) : okButton = okButton ?? false,
         okButtonTitle = okButtonTitle ?? "はい",
         ngButton = ngButton ?? false,
         ngButtonTitle = ngButtonTitle ?? "いいえ",
     super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleText = title != null ? Text(title!) : null;
    final contentText = title != null ? Text(content!) : null;
    final okButtonArea = okButton! 
      ?  GestureDetector(
          onTap: okButtonAction ?? ()=>Navigator.pop(context),
          child: Text(okButtonTitle!)
        )
      : null;
    final ngButtonArea = ngButton! 
      ?  GestureDetector(
          onTap: ngButtonAction ?? ()=>Navigator.pop(context),
          child: Text(ngButtonTitle!)
        )
      : null;

    return AlertDialog(
      title: titleText,
      content: contentText,
      actions: <Widget>[
        if(okButton == true) okButtonArea!,
        if(ngButton == true) ngButtonArea!
      ],
    );
  }
}