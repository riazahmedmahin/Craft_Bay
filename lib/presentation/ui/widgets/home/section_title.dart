import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, required this.onTapSeeall});

  final String title;
  final VoidCallback onTapSeeall;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        TextButton(onPressed: onTapSeeall, child: Text("See All"))
      ],
    );
  }
}
