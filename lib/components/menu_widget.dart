import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_positive/helper/ui_helper.dart';

/// Drawer Menu
class MenuWidget extends StatelessWidget {
  final menuItems = ['Home', 'Saved', 'Timeline', 'Donors', 'Requests', 'Blood Banks', 'Chats'];

  final num currentMenuPercent;
  final Function(bool) animateMenu;

  MenuWidget({Key key, this.currentMenuPercent, this.animateMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return currentMenuPercent != 0
        ? Positioned(
            left: realW(-358 + 358 * currentMenuPercent),
            width: realW(358),
            height: screenHeight,
            child: Opacity(
              opacity: currentMenuPercent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(realW(50))),
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.16), blurRadius: realW(20)),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (notification) {notification.disallowGlow();
                      },
                      child: CustomScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                            child: Container(
                              height: realH(236),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(realW(50))),
                                  gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
                                    Colors.red,
                                    Colors.redAccent
                                  ])),
                              child: Stack(
                                children: <Widget>[

                                  Positioned(
                                      top: realH(50),
                                      left: realW(20),
                                      child: Text(
                                        "RED",
                                        style: TextStyle(color: Colors.white, fontSize: realW(30),fontWeight:FontWeight.bold),
                                      )
                                  ),
                                  Positioned(
                                      top: realH(50),
                                      left: realW(80),
                                      child: Text(
                                        "POSITIVE",
                                        style: TextStyle(color: Colors.white, fontSize: realW(30),fontWeight:FontWeight.w100),
                                      )
                                  ),
                                  Positioned(
                                    left: realW(10),
                                    bottom: realH(27),
                                    child: Image.asset(
                                      "assets/avatar.png",
                                      width: realH(120),
                                      height: realH(120),
                                    ),
                                  ),
                                  Positioned(
                                    left: realW(60),
                                    bottom: realH(18),
                                    child: Image.asset(
                                      "assets/lable.png",
                                      width: realH(72),
                                      height: realH(72),
                                    ),
                                  ),
                                  Positioned(
                                    left: realW(135),
                                    top: realH(110),
                                    child: DefaultTextStyle(
                                      style: TextStyle(color: Colors.white),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "User Name",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: realW(18)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: realH(11.0)),
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text.rich(
                                                TextSpan(
                                                  text: "User Info or Id No.",
                                                  style: TextStyle(
                                                      fontSize: realW(16), decoration: TextDecoration.underline),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "Location or Address",
                                                style: TextStyle(fontSize: realW(14)),
                                              ),
                                              Icon(
                                                Icons.arrow_right,
                                                color: Colors.white,
                                                size: realH(30),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: EdgeInsets.only(top: realH(34), bottom: realH(50), right: realW(37)),
                            sliver: SliverFixedExtentList(
                              itemExtent: realH(56),
                              delegate: new SliverChildBuilderDelegate((BuildContext context, int index) {

                                return Container(
                                  width: realW(321),
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: realW(20)),
                                  decoration: index == 0
                                      ? BoxDecoration(
                                          color: Color(0x55ff0000).withOpacity(0.2),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(realW(50)),
                                              bottomRight: Radius.circular(realW(50))))
                                      : null,
                                  child: Text(
                                    menuItems[index],
                                    style:
                                        TextStyle(color: index == 0 ? Colors.white : Colors.black, fontSize: realW(20)),
                                  ),
                                );
                              }, childCount: menuItems.length),
                            ),
                          ),
                          SliverPadding(
                            padding: EdgeInsets.only(left: realW(20)),
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                'Settings',
                                style: TextStyle(color: Colors.black, fontSize: realW(20)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // close button
                    Positioned(
                      bottom: realH(53),
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          animateMenu(false);
                        },
                        child: Container(
                          width: realW(71),
                          height: realH(71),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: realW(17)),
                          child: Icon(
                            Icons.close,
                            color: Color(0xFFE96977),
                            size: realW(34),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFB5E74).withOpacity(0.2),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(realW(36)), topLeft: Radius.circular(realW(36))),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : const Padding(padding: EdgeInsets.all(0));
  }
}
