import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chips',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChipsHome(),
    );
  }
}

class ChipsHome extends StatefulWidget {
  @override
  _ChipsHomeState createState() => _ChipsHomeState();
}

class _ChipsHomeState extends State<ChipsHome> {
  int counter;
  var _chipsList = List<Widget>();

  Widget _getChips(int i) {
    final key = Key('item_$i',);
    final child = Container(
      key: key,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Chip(
          label: Text('$i item is here',),
          deleteIconColor: Colors.red,
          deleteButtonTooltipMessage: 'Delete',
          onDeleted: () => _deleteChip(key),
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade500,
            child: Text('$i', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
    counter++;
    return child;
  }

  _deleteChip(Key key) {
    _chipsList.forEach((element) {
      if (element.key == key)
        setState(() {
          _chipsList.remove(element);
        });
    });
  }

  void _onClicked() {
    Widget chip = _getChips(counter);
    setState(() => _chipsList.add(chip));
  }

  @override
  void initState() {
    counter = 0;
    for (int i = 0; i < 5; i++) {
      _chipsList.add(_getChips(i));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chips'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: _chipsList,
            ),
          ),
        ),
      ),floatingActionButton: FloatingActionButton(onPressed: _onClicked,child: Icon(Icons.add),backgroundColor: Colors.red,),
    );
  }
}
