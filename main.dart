import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dummy data to feed the list
  final List _items = [
    'University of Colombo',
    'University of Sri Japura',
    'University of Moratuwa',
    'University of Peradeniya',
    'University of Kelaniya',
    'Rajarata University',
    'University of Ruhuna',
    'Uva Wellassa University',
    'NSBM Green University',
    'University of Jaffna'
  ];

  
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('-- TOP - 10 UNIVERSITIES IN SRI-LANKA --')),
      body: Column(children: [
        // display selected item
        Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50),
            color: Color.fromARGB(255, 39, 0, 44),
            alignment: Alignment.center,
            child: Text(
              _items[_selectedItemIndex],
              style: const TextStyle(fontSize: 32, color: Color.fromARGB(255, 225, 255, 0)),
            )),
        // implement the List Wheel Scroll View
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: double.infinity,
            color: Color.fromARGB(255, 246, 151, 255),
            child: ListWheelScrollView(
              itemExtent: 100,
              diameterRatio: 1.8,
              onSelectedItemChanged: (int index) {
                // update the UI on selected item changes
                setState(() {
                  _selectedItemIndex = index;
                });
              },
              // children of the list
              children: _items
                  .map((e) => Card(
                        // make selected item background color is differ from the rest
                        color: _items.indexOf(e) == _selectedItemIndex
                            ? Color.fromARGB(255, 255, 94, 0)
                            : Color.fromARGB(255, 159, 0, 130),
                        child: Center(
                          child: Text(
                            e,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ]),
    );
  }
}