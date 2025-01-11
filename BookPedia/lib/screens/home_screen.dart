import 'package:flutter/material.dart';

void main() {
  runApp(const BookPediaApp());
}

class Book {
  final String title;
  final String author;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.description,
  });
}

class BookPediaApp extends StatelessWidget {
  const BookPediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookPedia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = [
      Book(
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        description: 'A story of decadence and excess.',
      ),
      Book(
        title: '1984',
        author: 'George Orwell',
        description: 'A dystopian social science fiction.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BookPedia'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookCard(book: books[index]);
        },
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          book.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(book.author),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailsPage(book: book),
            ),
          );
        },
      ),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              book.author,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              book.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}