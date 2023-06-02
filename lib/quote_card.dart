import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final void Function() delete;
  QuoteCard({required this.quote, required this.delete});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 16.0,),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.red,
              ),

            ),
            SizedBox(height: 8.0,),
            TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  textStyle: const TextStyle(fontSize: 20)),
              icon: const Icon(Icons.delete),
              onPressed: delete,
              label: const Text('Delete'),
            ),

          ],
        ),
      ),
    );
  }
}