import 'package:flutter/material.dart';


class drawerlogo extends StatelessWidget {
  const drawerlogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.receipt_long_outlined,size: 30.0,color: Colors.grey,),
        Text("E-LenDen",style: TextStyle(fontSize: 16.0,color: Colors.grey),),
      ],
    );
  }
}