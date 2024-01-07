import 'package:flutter/material.dart';


class circle_icon_botton extends StatelessWidget {
  circle_icon_botton({
    super.key,
    required this.onTap,
    required this.iconData,
  });
  final VoidCallback onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: Icon(iconData,color: Colors.grey,size: 20,),
      ),
    );
  }
}

