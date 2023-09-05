import 'package:flutter/material.dart';

class CatalogItem {
  final String title;
  final Color itemColor;
  final bool selected;
  final int id;

  CatalogItem({
    required this.id,
    required this.title,
    required this.itemColor,
    required this.selected,
  });
}
