import 'package:flutter/material.dart';

class ReachedEnd extends StatelessWidget {
  const ReachedEnd({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
