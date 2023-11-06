import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movieapp/model/CategoryResponse.dart';
import 'package:movieapp/model/browse_data.dart';

class BrowseItem extends StatelessWidget {
  BrowseData browseData;
  Genres genres;

  BrowseItem({super.key, required this.genres, required this.browseData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            browseData.imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          ClipRRect(
            // Clip it cleanly.
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                color: Colors.grey.withOpacity(0.3),
                alignment: Alignment.center,
                child: Text(
                  genres.name ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
