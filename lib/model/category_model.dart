import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart';

class CategoryModel {
  final String id;
  final String title;
  final Color color;

  const CategoryModel({
    required this.id,
    required this.title,
    this.color = Colors.yellow,
  });
}
