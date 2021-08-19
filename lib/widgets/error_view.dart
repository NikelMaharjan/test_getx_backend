import 'package:flutter/material.dart';
class ErrorView extends StatelessWidget {
  final String messages;
  final VoidCallback callback;
  const ErrorView({Key key,  this.messages,  this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(messages,style: Theme.of(context).textTheme.headline6,),
          const SizedBox(height: 12),
          TextButton(
              onPressed: () => callback(),
              child: const Text("Retry"))
        ],
      ),
    );
  }
}