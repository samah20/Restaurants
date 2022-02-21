import 'package:flutter/material.dart';

class SearchHomeScreen extends StatelessWidget {
  const SearchHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: TextField(
          decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(0.6),
              filled: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              hintText: 'Search Podcast',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              hintStyle: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
