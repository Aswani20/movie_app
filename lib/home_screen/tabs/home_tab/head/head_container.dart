import 'package:flutter/material.dart';
import 'package:movieapp/model/PopularMovie.dart';
import 'package:movieapp/my_theme.dart';

import '../custom_shape/custom_shape.dart';

class HeadContainer extends StatelessWidget {
  HeadMovie headMovie;
  HeadContainer({required this.headMovie});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Navigator to HeadContainerDetails
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
          vertical: MediaQuery.of(context).size.height * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              // alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  "assets/images/Image.png",
                  width: MediaQuery.of(context).size.width * 0.99,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.45,
                      vertical: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Icon(
                      Icons.play_circle,
                      size: 70,
                      color: MyTheme.whiteColor,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset("assets/images/smallImage.png"),
                          InkWell(
                            child: CustomPaint(
                              painter: Chevron(),
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
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                                horizontal:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              child: Text(
                                headMovie.originalTitle ?? "",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                                horizontal:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              child: Text(
                                headMovie.releaseDate ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
