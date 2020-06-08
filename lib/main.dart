import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

//  StatelessWidget makes the app itself a widget
//  In Flutter, almost everything is a widget, including alignment, padding and layout.
//  The Scaffold widget, from the Material library, provides a default app bar, title and a body property that holds
//  the widget tree for the home screen. The widget subtree can be quite complex.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(primaryColor: Colors.limeAccent),
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final saved = Set<WordPair>();
  final suggestions = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: pushSaved),
        ],
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          // divide i by 2 and returns an integer result
          // i.e.) 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2
          final index = i ~/ 2;

          // if you've reached the end of the available word pairings..
          if (index >= suggestions.length) {
            // then generate 10 more and add them to the suggestions list
            suggestions.addAll(generateWordPairs().take(10));
          }
          return buildRow(suggestions[index]);
        });
  }

  Widget buildRow(WordPair pair) {
    final bool alreadySaved = saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: biggerFont),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() { // triggers a call to the build() method for the State object, resulting in an update to the UI
          if (alreadySaved) {
            saved.remove(pair);
          } else {
            saved.add(pair);
          }
        });
      },
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = saved.map(
              (WordPair pair) {
                return ListTile(
                  title: Text(pair.asPascalCase, style: biggerFont),
                );
              },
          );
          final List<Widget> divided = ListTile
          .divideTiles(context: context, tiles: tiles)
              .toList();

          return Scaffold(
            appBar: AppBar(title: Text('Saved Suggestions')),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}