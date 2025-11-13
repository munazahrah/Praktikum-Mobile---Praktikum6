import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo GridView Builder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo GridView.Builder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List dataBerita = [];

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  Future _ambilData() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8928e5dd97ea4d04b6b201c04b43aa0f',
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          dataBerita = data['articles'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text(widget.title)),
      body: ListView.builder(
        itemCount: dataBerita.length,
        itemBuilder: (context, index) {
          String? imageUrl = dataBerita[index]['urlToImage'];
          if (imageUrl == null ||
              imageUrl.isEmpty ||
              !(imageUrl.startsWith('http://') ||
                  imageUrl.startsWith('https://'))) {
            imageUrl =
                'https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg';
          } else if (imageUrl.startsWith('http://')) {
            imageUrl = imageUrl.replaceFirst('http://', 'https://');
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                leading: Image.network(
                  imageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg',
                      width: 100,
                      fit: BoxFit.cover,
                    );
                  },
                ),
                title: Text(
                  dataBerita[index]['title'] ?? 'No Title',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  dataBerita[index]['publishedAt'] ?? 'No data',
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
