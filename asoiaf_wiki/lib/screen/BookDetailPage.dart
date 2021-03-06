import 'package:asoiaf_wiki/services/BookServices.dart';
import 'package:asoiaf_wiki/widgets/card.dart';
import 'package:asoiaf_wiki/widgets/bookCard.dart';
import 'package:asoiaf_wiki/model/Book.dart';
import 'package:flutter/material.dart';
import 'package:asoiaf_wiki/util/global.dart';
import 'package:animate_do/animate_do.dart';

class BookDetailPage extends StatelessWidget {
  final Book? selectedBook;
  const BookDetailPage({
    Key? key,
    this.selectedBook
    }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Global.colorHoney,
        foregroundColor: Global.colorJet,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Icon(Icons.shield),
          const SizedBox(width: 10),
          Text('A Song of Ice and Fire ' + selectedBook!.name!)
          ],
        ),
      ),

      body: Builder(
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: bookCard(
                height: 800,
                width: 800,
                title: selectedBook!.name,
                authors: selectedBook!.authors,
                numberOfPages: selectedBook!.numberOfPages,
                publisher: selectedBook!.publisher,
              )
            ),
          );
      })

      
    );
  }
}
