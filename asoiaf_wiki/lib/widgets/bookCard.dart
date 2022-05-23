import 'package:flutter/material.dart';
import 'package:asoiaf_wiki/util/global.dart';
import 'package:asoiaf_wiki/shared/responsive.dart';

class bookCard extends StatelessWidget {
  final String? title;
  final List<String>? authors;
  final int? numberOfPages;
  final String? publisher;
  final bool? hasColor;
  final void Function()? onPressed;
  final Color? color;
  final double? height;
  final double? width;
  final double? fontSize;
  final bool? otherColor;
  final Color? colorButton;

const bookCard({ 
  Key? key,
  this.title,
  this.authors,
  this.numberOfPages,
  this.publisher,
  this.hasColor,
  this.onPressed,
  this.color,
  this.height,
  this.width,
  this.fontSize,
  this.otherColor,
  this.colorButton
 }) : super(key: key);

 @override
 Widget build(BuildContext context) {

   @override
   String getAuthors(authors) {
     String finalAuthors = 'Author(s): ';

     for (var author in authors) {
       finalAuthors += author + ' ';
     }

     return finalAuthors;
   }

      @override
   String getNumberOfPages(numberOfPages) {
     return 'Number of pages: $numberOfPages';
   }

      @override
   String getPublisher(publisher) {
     return 'Publisher: $publisher';
   }

    double fontSizeButton = 0;
    if (isTab(context) || isDesktop(context)) {
      fontSizeButton = fontSize ?? 20;
    } else if (isMobile(context)) {
      fontSizeButton = fontSize ?? 16;
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          child: Ink(
            decoration: BoxDecoration(
              color: Global.colorSnow,
              borderRadius: BorderRadius.circular(30.0)
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: onPressed,
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title!,
                              style: TextStyle(
                                color: Global.colorJet,
                                fontWeight: FontWeight.w400,
                                fontSize: 30                        ),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              getAuthors(authors),
                              style: TextStyle(
                                color: Global.colorJet,
                                fontWeight: FontWeight.w400,
                                fontSize: 20                        ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              getNumberOfPages(numberOfPages),
                              style: TextStyle(
                                color: Global.colorJet,
                                fontWeight: FontWeight.w400,
                                fontSize: 20                        ),
                            ),
                            Spacer(),
                            Text(
                              getPublisher(numberOfPages),
                              style: TextStyle(
                                color: Global.colorJet,
                                fontWeight: FontWeight.w400,
                                fontSize: 20                        ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ), );
 }
}