

import 'package:flutter/material.dart';
import 'package:schooler_chat/constants.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.title, required this.description, required this.imageUrl, required this.price,
  });

  final String title, description, imageUrl;
  final double price;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Placeholder
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                imageUrl
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Title
           Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            maxLines: 1,
          ),
          // Content/Description
           Text(
            description,
            style: TextStyle(fontSize: 11, color: Colors.black54),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          // Price
           Text(
            price.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
