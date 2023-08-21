import 'package:flutter/material.dart';

class TexShow extends StatefulWidget {
  const TexShow({Key? key, required this.texts}): super(key: key);
  final String texts;
  @override
  State<TexShow> createState() => _TexShowState();
}

class _TexShowState extends State<TexShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      width: double.infinity,
      child: Text(
        widget.texts,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 50.0,
        ),
        textAlign: TextAlign.center,
      ),
    );   
  }
}