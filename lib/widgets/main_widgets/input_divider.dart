import 'package:flutter/material.dart';

class inputDivider extends StatelessWidget {
  const inputDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.black.withOpacity(0.3),
                width: 0.5)),
      ),
    );
  }
}