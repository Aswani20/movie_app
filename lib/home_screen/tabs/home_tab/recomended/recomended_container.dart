import 'package:flutter/material.dart';
import 'package:movieapp/home_screen/tabs/home_tab/custom_shape/custom_shape.dart';
import 'package:movieapp/model/RecomendedMovie.dart';
import 'package:movieapp/my_theme.dart';

class RecomendedContainer extends StatelessWidget {
  Recomended recomendedMovie;
  RecomendedContainer({required this.recomendedMovie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset("assets/images/smallImage.png"),
        ),
        InkWell(
          onTap: (){
            //click to move in wishlist
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomPaint(
              painter:Chevron(),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.height * 0.06,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: MyTheme.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
