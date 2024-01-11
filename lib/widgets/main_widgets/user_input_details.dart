import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class userInputDetails extends StatelessWidget {
  const userInputDetails(
      {super.key,
      required TextEditingController controller,
      required this.name})
      : _controller = controller;

  final TextEditingController _controller;
  final String name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Fill the Box';
        }
        return null;
      },
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "$name",
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
        filled: true,
        fillColor: KsecondaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
