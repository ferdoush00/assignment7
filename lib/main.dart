import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Product(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        centerTitle: true,
      )),
    );
  }
}

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  void showPop(index) {
    setState(
      () {
        items[index]['count']++;
        if (items[index]['count'] >= 5) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Congratulations!'),
                content: Text('You\'ve bought 5 ${items[index]['name']}!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // print('Pressed');
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                title: Text('${items[index]['name']}'),
                subtitle: Text(items[index]['Price']),
                trailing: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Count: ${items[index]['count'].toString()}'),
                        ElevatedButton(
                          onPressed: () {
                            showPop(index);
                          },
                          child: const Text('Buy Now'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int totalNumberBought = getTotalItemCount();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartPage(totalNumberBought)),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
