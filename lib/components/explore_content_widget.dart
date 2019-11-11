import 'package:flutter/material.dart';
import 'package:red_positive/helper/ui_helper.dart';


class ExploreContentWidget extends StatelessWidget {
  final double currentExplorePercent;

  const ExploreContentWidget({Key key, this.currentExplorePercent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentExplorePercent != 0) {
      return Positioned(
        top: realH(100 + screenHeight + (200 - screenHeight) * currentExplorePercent),
        width: screenWidth,
        child: Container(
          height: screenHeight,
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: realW(22)),
                child: Text("SEARCH AS",
                    style:
                    const TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.bold)),
              ),
              Opacity(
                opacity: currentExplorePercent,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[

                    Expanded(
                      child: Transform.translate(
                        offset: Offset(screenWidth / 3 * (1 - currentExplorePercent),
                            screenWidth / 3 / 2 * (1 - currentExplorePercent)),
                        child: Image.asset(
                          "assets/latest.png",
                          width: realH(133),
                          height: realH(133),
                          scale: 0.5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/nearest.png",
                        width: realH(133),
                        height: realH(133),
                        scale: 0.5,
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: realW(22)),
                child: Text("BLOOD GROUPS",
                    style:
                    const TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.bold)),
              ),
              Transform.translate(
                  offset: Offset(0, realH(23 + 380 * (1 - currentExplorePercent))),
                  child: Opacity(
                      opacity: currentExplorePercent,
                      child: Container(
                        width: screenWidth,
                        height: realH(172 + (172 * 4 * (1 - currentExplorePercent))),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: realW(22)),
                            ),
                            buildListItem(0),
                            buildListItem(1),
                            buildListItem(2),
                            buildListItem(3),
                            buildListItem(4),
                            buildListItem(5),
                            buildListItem(6),
                            buildListItem(7),
                          ],
                        ),
                      ))),
              Padding(
                padding: EdgeInsets.only(left: realW(22)),
                child: Text("LOOKING FOR",
                    style:
                    const TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.bold)),
              ),

              Transform.translate(
                  offset: Offset(0, realH(23 + 380 * (1 - currentExplorePercent))),
                  child: Opacity(
                      opacity: currentExplorePercent,
                      child: Container(
                        width: screenWidth,
                        height: realH(100 + (172 * 4 * (1 - currentExplorePercent))),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: realW(22)),
                            ),

                            Image.asset("assets/blood.png",width:200,scale: 0.5,),
                            Image.asset("assets/request.png",width: 200,scale: 0.5,),
                            Image.asset("assets/donor.png",width:200,scale: 0.5, )

                          ],
                        ),
                      ))),



            ],
          ),
        ),
      );
    } else {
      return const Padding(
        padding: const EdgeInsets.all(0),
      );
    }
  }

  buildListItem(int index, ) {
    return Transform.translate(
      offset: Offset(0, index * realH(127) * (1 - currentExplorePercent)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            "assets/grp${index % 8 + 1}.png",
            width: realH(127),
            height: realH(127),
            scale: 0.5,
          ),

        ],
      ),
    );
  }
}
