import 'package:flutter/material.dart';
import './random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = generateWordPairs();
    return MaterialApp(
        // theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.amber[700])),
        theme:
            ThemeData(primarySwatch: Colors.amber, cardColor: Colors.blue[600]),
        home:
            RandomWords() // Scaffold(appBar: AppBar(title: Text("WordPair Generator")),body: Center(child: Text(wordPair.asPascalCase),))

        );
  }
}
