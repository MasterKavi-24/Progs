import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'book.dart';
import 'bookcard.dart';
import 'bookshelper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _value = 1;
  List<dynamic> books = [];
  TextEditingController searchController = TextEditingController();
  late BooksHelper helper = BooksHelper();
  late FixedExtentScrollController _controller;

  Future initialize() async {
    // print(searchController.text);
    books = await helper.getBooks("Trend");
    setState(() {
      // int booksCount = books.length;
      books = books;
    });
  }

  Future<void> _handleRefresh() async {
    // return await Future.delayed(Duration(seconds: 2));
    initState();
  }

  @override
  void initState() {
    helper = BooksHelper();
    _controller = FixedExtentScrollController();
    searchController = TextEditingController();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          title: Text("BOOKS API"),
          centerTitle: true,
          backgroundColor: Colors.grey[500]),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: Colors.grey,
        height: 200,
        backgroundColor: Colors.grey[200],
        animSpeedFactor: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 25),
            //   child: Container(
            //     padding: EdgeInsets.all(8),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.white),
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Icon(Icons.menu, color: Colors.grey[800]),
            //   ),
            // ),
            // SizedBox(
            //   height: 25,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                "Discover",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(left: 25),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search for a book..."),
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                        onSubmitted: (text) {
                          if (text != '') {
                            helper.getBooks(text).then((value) {
                              books = value;
                              setState(() {
                                searchController.clear();
                                books = books;
                              });
                            });
                          }
                        },
                      ),
                    )),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //   child: Container(
                    //     child: IconButton(
                    //       icon: Icon(Icons.search),
                    //       onPressed: () {
                    //       },
                    //       ),
                    //     height: 30,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 450,
                    child:
                        /*ListWheelScrollView.useDelegate(
                        controller: _controller,
                        diameterRatio: 1.3,
                        perspective: 0.005,
                        itemExtent: 4, childDelegate: ListWheelChildBuilderDelegate(
                          childCount: books.length,
                          builder: (context, index) {
                            Book tempBook = books[index];
                            return BookCard(
                              id: tempBook.id,
                              title: tempBook.title,
                              description: tempBook.description,
                              subtitle: tempBook.subtitle,
                              publisher: tempBook.publisher,
                              pages: tempBook.pages,
                              imgUrl: tempBook.imgUrl,
                              authors: tempBook.authors,
                              publishedDate: tempBook.publishedDate,
                            );
                          }
                        )),
                      */

                        ListView.builder(
                            itemCount: books.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              Book tempBook = books[index];
                              return BookCard(
                                id: tempBook.id,
                                title: tempBook.title,
                                description: tempBook.description,
                                subtitle: tempBook.subtitle,
                                publisher: tempBook.publisher,
                                pages: tempBook.pages,
                                imgUrl: tempBook.imgUrl,
                                authors: tempBook.authors,
                                publishedDate: tempBook.publishedDate,
                              );
                            }),
                  ),
                ),
              ],
            )

            // Row(
            //   children: [
            //     BookCard(bookName: "Flutter for Beginners"),
            //     BookCard(bookName: "Flutter for Beginners"),
            //   ],
            // ),
            // SizedBox(height: 40,),
            // Row(
            //   children: [
            //     BookCard(bookName: "Flutter for Beginners"),
            //     BookCard(bookName: "Flutter for Beginners"),
            //   ],
            // ),
            // SizedBox(height: 40,),
            // Row(
            //   children: [
            //     BookCard(bookName: "Flutter for Beginners"),
            //     BookCard(bookName: "Flutter for Beginners"),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
