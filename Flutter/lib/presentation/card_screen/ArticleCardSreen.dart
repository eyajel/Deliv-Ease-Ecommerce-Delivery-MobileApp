import 'package:flutter/material.dart';

class ArticleCardScreen extends StatelessWidget {
 final List<String> articles; // List of article titles
 final Function(String) onDelete; // Callback function to delete an article

 const ArticleCardScreen({Key? key, required this.articles, required this.onDelete}) : super(key: key);

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(articles[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => onDelete(articles[index]),
            ),
          );
        },
      ),
    );
 }
}
