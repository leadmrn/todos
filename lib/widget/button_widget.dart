import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            backgroundColor: Colors.purple),
        child: Text(text),
        onPressed: onClicked,
      );
}
