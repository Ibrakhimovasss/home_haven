import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_haven/common/utils/app_images.dart';
import 'package:home_haven/data/models/furniture_model.dart';

class FurnitureCard extends StatelessWidget {
  final FurnitureData furnitureData;
  const FurnitureCard({
    super.key,
    required this.furnitureData,
  });

  @override
  Widget build(BuildContext context) {
    log("${(1 - furnitureData.discount! / 100) * furnitureData.price!}");
    final discountPrice =
        ((1 - furnitureData.discount! / 100) * furnitureData.price!).round();
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 221, 221).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  "https://e-commerce.birnima.uz${furnitureData.image![0]}",
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 0, 0, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '${furnitureData.discount}% OFF',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  furnitureData.name.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // SizedBox(height: 4),
                Text(
                  '\$${(1 - furnitureData.discount! / 100) * furnitureData.price!}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$${furnitureData.price}',
                  style: TextStyle(
                    color: Color.fromARGB(255, 61, 61, 61),
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 19, 19),
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${furnitureData.rating} (${furnitureData.ratingCount})',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 141, 141, 141),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
