// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Dinamic',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Building List View Dinamic'),
          centerTitle: true,
        ),
        body: BodyListViewDinamic(),
      ),
    );
  }
}

class BodyListViewDinamic extends StatelessWidget {
  const BodyListViewDinamic({super.key});

  @override
  Widget build(BuildContext context) {
    return _myListViewDinamic();
  }
}

Widget _myListViewDinamic() {
  final List<ListItem> items = List<ListItem>.generate(
      10000,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MessageItem('Sender $i', 'Message body $i'));

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];

      if (item is HeadingItem) {
        return ListTile(
          title: Text(
            item.heading,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
      } else if (item is MessageItem) {
        return ListTile(
          title: Text(item.sender),
          subtitle: Text(item.body),
          leading: Icon(
            Icons.insert_photo,
            color: Colors.red,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        );
      }
      return null;
      /*
      return Card(
        child: ListTile(
          title: Text('${items[index]}'),
          leading: Icon(
            Icons.insert_photo,
            color: Colors.red,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      );
      */
    },
  );
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);
}
