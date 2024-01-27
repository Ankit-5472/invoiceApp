import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class userInputDetails extends StatelessWidget {
  const userInputDetails({
    Key? key,
    required TextEditingController controller,
    required this.name,
    required this.validator,
  }) : _controller = controller, super(key: key);

  final TextEditingController _controller;
  final String name;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: validator,
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
