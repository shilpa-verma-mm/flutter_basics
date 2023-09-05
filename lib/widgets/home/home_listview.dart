import 'package:flutter/material.dart';
import 'package:flutter_basics/data/catalog_data.dart';
import 'package:flutter_basics/models/catalog_item.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeListViewScreen extends StatelessWidget {
  const HomeListViewScreen(
    this.price,
    this.onAdd, {
    super.key,
  });

  final int price;
  final Function(CatalogItem item)? onAdd;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catalogData.length,
      itemBuilder: (
        context,
        index,
      ) {
        return Container(
          margin: const EdgeInsets.only(
            bottom: 15,
            left: 10,
            right: 10,
          ),
          child: Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: catalogData[index]
                        .itemColor, // Set the background color
                    borderRadius:
                        BorderRadius.circular(20.0), // Set the border radius
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(
                catalogData[index].title,
                style: GoogleFonts.laBelleAurore(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' price is \$${price.toString()}',
                style: GoogleFonts.laBelleAurore(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Checkbox(
                value: catalogData[index].selected,
                onChanged: (value) {
                  onAdd!(catalogData[index]);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
