import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];
  final _checkedWordPairs = Set<WordPair>();
  // empty list.

  Widget _buildList() {
    Divider();
    return ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, item) {
          // if (item.isOdd) return Divider();

          // final index = item ~/ 2;
          // Divider(
          //   thickness: 3,
          // );
          final index = item;

          if (index >= _randomWordPairs.length) {
            _randomWordPairs.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_randomWordPairs[index]);
        });
    // return ListView(
    //   padding: const EdgeInsets.all(8),
    //   children: <Widget>[
    //     Container(
    //       height: 50,
    //       color: Colors.amber[600],
    //       child: const Center(child: Text('Entry A')),
    //     ),
    //     Container(
    //       height: 50,
    //       color: Colors.teal,
    //       child: const Center(child: Text('data')),
    //     ),
    //   ],
    // );
  }

  Widget _buildRow(WordPair pair) {
    final alreadyChecked = _checkedWordPairs.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase,
          style: alreadyChecked
              ? TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough)
              : TextStyle(fontSize: 18)),
      trailing: Icon(
          alreadyChecked ? Icons.check_box : Icons.check_box_outline_blank),
      onTap: () {
        setState(() {
          if (alreadyChecked) {
            _checkedWordPairs.remove(pair);
          } else {
            _checkedWordPairs.add(pair);
          }
        });
      },
    );
    // Divider(
    //   thickness: 3,
    // );
  }

  void _pushChecked() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _checkedWordPairs.map((WordPair pair) {
        return ListTile(
            title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16)));
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(title: Text("Checked WordPairs")),
        body: ListView(children: divided),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WordPair Generator"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _pushChecked)
          ],
        ),
        body: _buildList());
  }
}
