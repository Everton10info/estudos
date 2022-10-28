import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MessagePage extends StatefulWidget {
  final String message;
  final Color color;

  const MessagePage({
    super.key,
    required this.message,
    required this.color,
  });

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 50,
          title: const Text('Modular'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: widget.color,
                child: Text(widget.message),
              ),
            )
          ],
        ),
      ),
    );
  }
}
