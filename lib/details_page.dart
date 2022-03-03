import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final BuildContext context;
  const DetailsPage({required this.image,required this.title,required this.price,required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
      
    );
  }
}