import 'package:flutter/material.dart';
import 'package:flutter_basics/models/cartmodel.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, cart, child) {
      return const Center(
        child: Text("CatalogScreen"),
      );
    });
  }
}
