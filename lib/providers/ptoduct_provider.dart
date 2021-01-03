import 'package:flutter/material.dart';
import '../providers/product.dart';


class ProductsProvider with ChangeNotifier{

  List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Cactus',
      description: 'A domestic Cactus',
      price: 29.99,
      shopName: "Omo",
      imageUrl:
      'https://images.unsplash.com/photo-1504648492881-a5150829085c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mjh8fHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60.jpg',
    ),
    Product(
      id: 'p2',
      title: 'A flower',
      description: 'A nice flower',
      shopName: "Eti",
      price: 59.99,
      imageUrl:
      'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHw%3D&auto=format&fit=crop&w=500&q=60.png',
    ),
    Product(
      id: 'p3',
      title: 'A Camera',
      description: 'Dope ass camera',
      price: 19.99,
      shopName: "Humble",
      imageUrl:
      'https://images.unsplash.com/photo-1521499892833-773a6c6fd0b8?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHw%3D&auto=format&fit=crop&w=500&q=60.png',
    ),
    Product(
      id: 'p4',
      title: 'Doors',
      description: 'Get a classic door of any color for yourself.',
      price: 49.99,
      shopName: "Uwak",
      imageUrl:
      'https://images.unsplash.com/photo-1543005240-6a7dcea5bfca?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTJ8fHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60.png',
    ),
  ];

  List<Product> get products{
    return [..._products];
  }
}