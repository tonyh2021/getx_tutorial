import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MessagesPage  extends StatelessWidget  {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Messages Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
