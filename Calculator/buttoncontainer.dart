import 'package:flutter/material.dart';
import 'functions.dart';

class ButContainer extends StatefulWidget {
  const ButContainer({Key? key, required this.buttext, required this.func}) : super(key: key);
  final String buttext;
  final String func;
  @override
  State<ButContainer> createState() => _ButContainerState();
}

class _ButContainerState extends State<ButContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35), // Uzaklık ayarı
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(80, 80),
          shape: const CircleBorder(),
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          setState(() {
            if(widget.func=="0"){deleteall();}
            else if(widget.func=="1"){equal();}
            else if(widget.func=="3"){add(widget.buttext);}
          });
        },
        child: Text(
          widget.buttext,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35.0,
          ),
        ),
      ),
    );
  }
}

