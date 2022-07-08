import 'genre_checkbox.dart';
import 'package:flutter/material.dart';

class GenreSelector extends StatefulWidget {
  GenreSelector({Key? key}) : super(key: key);

  @override
  State<GenreSelector> createState() => _GenreSelectorState();
}

class _GenreSelectorState extends State<GenreSelector> {
  List genres = [
    "Action",
    "Adventure",
    "Comedy",
    "Crime",
    "Drama",
    "Fiction",
    "Fantasy",
    "Historical",
    "Horror",
    "Mythology",
    "Mystery",
    "Real Story",
    "Romance",
    "Science Fiction",
    "Thriller",
    "Western",
  ];

  late FixedExtentScrollController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genre Selector"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
          child: Container(
            width: 300,
            height: 300,
            child: ListWheelScrollView.useDelegate(
                controller: _controller,
                diameterRatio: 1.3,
                perspective: 0.005,
                itemExtent: 60,
                physics:
                    ScrollPhysics(), // always land on the number rather than sliding away
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: genres.length,
                  builder: (context, index) {
                    return GenreCheckbox(
                      genre: genres[index],
                      isChecked: false,
                    );
                  },
                )),
          ),
          )
        ],
      )
    );
  }
}
