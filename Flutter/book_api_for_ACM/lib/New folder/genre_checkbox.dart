import 'package:flutter/material.dart';

class GenreCheckbox extends StatefulWidget {
  final String genre;
  bool isChecked;
  GenreCheckbox({required this.genre, required this.isChecked});

  @override
  State<GenreCheckbox> createState() => _GenreCheckboxState();
}

class _GenreCheckboxState extends State<GenreCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: widget.isChecked,
            onChanged: (isChecked) {
              setState(() {
                widget.isChecked = isChecked!;
              });
            },
          ),
          Text(widget.genre)
        ],
      ),
    );
  }
}
