import 'dart:ffi';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211137',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class Clothes {
  final String name;
  final String image;
  final String description;
  final double price;

  Clothes({
      required this.name,
      required this.image,
      required this.description,
      required this.price
  });
}

class HomeScreen extends StatelessWidget {
  final List<Clothes> clothes = [
    Clothes(
      name: 'Маица',
      image: 'https://www.sport-m.com.mk/ProductImages/586667-30.jpg',
      description: 'PUMA ESS Logo Tee - Одлична маица за спортување.',
      price: 1390,
    ),
    Clothes(
      name: 'Панталони',
      image: 'https://www.sport-m.com.mk/ProductImages/IY1486.jpg',
      description: 'Adidas M CE FL PT - Направени од мек материјал, овозможуваат максимална удобност додека талкате по кривулестите градски улици или барате утеха во природата.',
      price: 3990,
    ),
    Clothes(
      name: 'Јакна',
      image: 'https://www.sport-m.com.mk/ProductImages/IK3176_3.jpg',
      description: 'Adidas HELIONIC HO JKT - Оваа јакна се одликува со редовен фит и делумно е направена со рециклирани материјали, што ја покажува посветеноста на adidas на одржливоста.',
      price: 12900,
    ),
    Clothes(
      name: 'Патики',
      image: 'https://www.sport-m.com.mk/ProductImages/389289-32-sv01.jpg',
      description: 'Puma Trinity - Со синтетички прекривки на мрежест горен дел што обезбедува вентилација, овие патики обезбедуваат трендовски изглед и оптимални перформанси.',
      price: 3890,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Индекс: 211137'),
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final item = clothes[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(item.image),
              title: Text(item.name),
              subtitle: Text(item.price.toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Clothes item;

  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.image),
            SizedBox(height: 20),
            Text(
              item.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              item.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Цена: ${item.price} денари',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
