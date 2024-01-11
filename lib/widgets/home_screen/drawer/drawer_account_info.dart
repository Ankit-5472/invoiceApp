import 'package:e_lenden/utils/constants/constants.dart';
import 'package:flutter/material.dart';


class drawerAccountInfo extends StatelessWidget {
  const drawerAccountInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Company's Name", style: KaccountText,),
          Text("999999999", style: KaccountdetailsText,),
        ],
      ),
    );
  }
}

