import 'package:asoiaf_wiki/screen/BookDetailPage.dart';
import 'package:asoiaf_wiki/services/BookServices.dart';
import 'package:asoiaf_wiki/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:asoiaf_wiki/util/global.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {

  BookServices bookServices = BookServices();
  bool cargando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.colorHoney,
        foregroundColor: Global.colorJet,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Icon(Icons.shield),
          const SizedBox(width: 10),
          const Text('A Song of Ice and Fire - Wiki - Books')
          ],
        ),
      ),


      body: FutureBuilder(
           future: bookServices.getBooks(),
           builder: (BuildContext context, AsyncSnapshot snapshot){
              
             if(!snapshot.hasData){
               return Center(
                child: Text('Loading...'),
               );
             } 

             return Container(
               alignment: Alignment.center,
               child: SizedBox(
                 width: 400,
                 child: ListView.builder(
                     itemCount: snapshot.data.length,
                     itemBuilder: (BuildContext context, int index){
                       return card(
                         title: snapshot.data[index].name,
                         height: 50,
                         width: 100,

                         onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BookDetailPage(
                                        selectedBook: snapshot.data[index],
                                      )
                                    )
                                  );
                            },

                       );
                     }
                 ),
               ),
             );

             
           },
         ),
    );
  }
}
