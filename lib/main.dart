import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isDescending = false;
  List<String> items = [
    'Murphy',
    'Oliver',
    'Sofia',
    'Yasmin',
    'Zahara',
    'Anna',
    'Brandon',
    'Emma',
    'Lucas',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextButton.icon(
              // ignore: prefer_const_constructors
              icon: RotatedBox(
                quarterTurns: 1,
                child: const Icon(Icons.compare_arrows, size: 28),
              ),
              label: Text(
                isDescending ? 'Decending' : 'Ascending',
                style: const TextStyle(fontSize: 16),
              ),
              onPressed: () => setState(() => isDescending = !isDescending),
            ),
            Expanded(child: buildList()),
          ],
        ),
      );

  Widget buildList() => ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final sortedItems = items
          ..sort((item1, item2) =>
              isDescending ? item2.compareTo(item1) : item1.compareTo(item2));
        final item = sortedItems[index];

        return ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              'https://source.unsplash.com/random?sig= $index',
            ),
          ),
          title: Text(item),
          subtitle: Text('Subtitle $index'),
          onTap: () {},
        );
      });
}
