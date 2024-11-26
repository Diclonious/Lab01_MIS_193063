import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Network Images',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ClothesListScreen(),
    );
  }
}

class ClothesListScreen extends StatelessWidget {
  final List<Map<String, String>> clothes = [
    {
      'name': 'T-Shirt',
      'image': 'https://images.unsplash.com/photo-1524282850895-b7921c3b241d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description': 'Comfortable cotton t-shirt.',
      'price': '10.99'
    },
    {
      'name': 'Jeans',
      'image': 'https://images.unsplash.com/photo-1604176354204-9268737828e4?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description': 'Stylish blue jeans.',
      'price': '29.99'
    },
    {
      'name': 'Sneakers',
      'image': 'https://cdn.thewirecutter.com/wp-content/media/2024/05/white-sneaker-2048px-9320.jpg?auto=webp&quality=75&width=1024',
      'description': 'Durable running sneakers.',
      'price': '49.99'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('193063')),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final item = clothes[index];
          return Card(
            key: ValueKey(item['name']), // Assign a unique key
            child: ListTile(
              leading: Image.network(
                item['image']!, // Network image
                fit: BoxFit.cover, // Ensure proper scaling
                width: 50, // Set fixed width
                height: 50, // Set fixed height
              ),
              title: Text(item['name']!),
              subtitle: Text('\$${item['price']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClothesDetailScreen(item: item),
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


class ClothesDetailScreen extends StatelessWidget {
  final Map<String, String> item;

  ClothesDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250, // Set a fixed height for the image
                  width: 250, // Set a fixed width for the image
                  child: Image.network(
                    item['image']!,
                    fit: BoxFit.cover, // Crop the image to fit within the bounds
                  ),
                ),
                
              ],
            ),
            
            SizedBox(height: 16),
            Text(
              'Price: \$${item['price']}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(width: 13), // Add some spacing between the image and the rest of the content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12),
                      Text(item['description']!),
                    ],
                  ),
                ),
            
          ],
        ),
      ),
    );
  }
}

