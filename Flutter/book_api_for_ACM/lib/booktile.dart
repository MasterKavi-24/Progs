import 'homepage.dart';
import 'package:flutter/material.dart';

class BookTile extends StatefulWidget {
  final String id;
  final String title;
  final String subtitle;
  final String authors;
  final String description;
  final String publisher;
  final String publishedDate;
  final int pages;
  final String imgUrl;

  BookTile(
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
  State<BookTile> createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.imgUrl), fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                  // left: 20
                  left: 10,
                  top: 70,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        HomePage()));
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.black,
                        ),
                      )
                    ],
                  )),
              Positioned(
                  // top: 330
                  top: 270,
                  child: Container(
                      padding: EdgeInsets.only(left: 19, right: 19, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.grey[500],
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: Text(
                                    widget.subtitle == ''
                                        ? widget.title
                                        : widget.title + ": " + widget.subtitle,
                                    style: TextStyle(
                                        color: Colors.black54.withOpacity(0.8),
                                        fontSize: 25),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "By: " + widget.authors,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            widget.description != ''
                                ? Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Container(
                                          height: 65,
                                          child: Text(
                                            "About the book: " +
                                                widget.description,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            widget.pages != 0
                                ? Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Container(
                                          height: 65,
                                          child: Text(
                                            "Pages: " + widget.pages.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            widget.description != ""
                                ? Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Container(
                                          height: 65,
                                          child: Text(
                                            "Publication: " + widget.publisher,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(height: 20),
                            Text(
                              "Published On: " + widget.publishedDate,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic),
                            ),
                          ])))
            ])));
  }
}
