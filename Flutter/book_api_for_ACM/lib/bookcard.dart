import 'booktile.dart';
import 'package:flutter/material.dart';

class BookCard extends StatefulWidget {
  final String id;
  final String title;
  final String subtitle;
  final String authors;
  final String description;
  final String publisher;
  final String publishedDate;
  final int pages;
  final String imgUrl;

  BookCard(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.authors,
      required this.description,
      required this.publisher,
      required this.publishedDate,
      required this.pages,
      required this.imgUrl});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => BookTile(
              id: widget.id,
              title: widget.title,
              subtitle: widget.subtitle,
              description: widget.description,
              authors: widget.authors,
              imgUrl: widget.imgUrl,
              pages: widget.pages,
              publishedDate: widget.publishedDate,
              publisher: widget.publisher,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[800]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 224,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.subtitle == ''
                            ? widget.title
                            : widget.title + ": " + widget.subtitle,
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.network(
                        widget.imgUrl,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    /*
                    MeetNetworkImage(
                        imageUrl: widget.imgUrl,
                        loadingBuilder: (context) =>
                            Center(child: CircularProgressIndicator()),
                        errorBuilder: (context, e) => Center(
                              child: Text('Error appear!'),
                            ))
                    */
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                widget.publisher == ""
                    ? Text("")
                    : Text(
                        "Publisher: ${widget.publisher}",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.white),
                      ),
                widget.pages == 0
                    ? Text("")
                    : Text(
                        "Pages: ${widget.pages}",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.white),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
