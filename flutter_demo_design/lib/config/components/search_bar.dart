import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  final String hintText;
  SearchBar({this.hintText});

  @override
  Widget build(BuildContext context) {

    final TextEditingController controller = TextEditingController();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0.1, 0.1),
          ),
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(-0.1, -0.1),
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
