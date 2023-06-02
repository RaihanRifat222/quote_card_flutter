import 'package:flutter/material.dart';
import 'quote.dart';

class AddQuoteDialog extends StatefulWidget {
  final void Function(Quote) onAddQuote;

  const AddQuoteDialog({Key? key, required this.onAddQuote}) : super(key: key);

  @override
  _AddQuoteDialogState createState() => _AddQuoteDialogState();
}

class _AddQuoteDialogState extends State<AddQuoteDialog> {
  String text = '';
  String author = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Poem'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                text = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Poem',

            ),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                author = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Author',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (text.isNotEmpty && author.isNotEmpty) {
              widget.onAddQuote(Quote(text: text, author: author));
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
