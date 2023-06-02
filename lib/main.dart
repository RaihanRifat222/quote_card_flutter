import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
import 'add_quote_dialog.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(text: 'No country for old men', author: 'bad bad'),
    Quote(text: 'Country Roads', author: 'John Denver'),
  ];

  void addQuote(Quote quote){
    setState(() {
      quotes.add(quote);
    });
  }

//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.grey[700],
//       appBar: AppBar(
//         title: Text('Awesome Quotes'),
//         centerTitle: true,
//         backgroundColor: Colors.redAccent,
//
//
//       ),
//       body: Column(
//         children: quotes.map((quote)=>  QuoteCard(
//             quote: quote,
//           delete: (){
//               setState(() {
//                 quotes.remove(quote);
//               });
//           }
//         )).toList(),
//       ),
//
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddQuoteDialog(
                    onAddQuote: addQuote,
                  );
                },
              );
            },
            child: Text('Add Poem'),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                return QuoteCard(
                  quote: quotes[index],
                  delete: () {
                    setState(() {
                      quotes.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


