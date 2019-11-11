import 'package:flutter/material.dart';
import 'package:red_positive/helper/ui_helper.dart';

class SearchMenuWidget extends StatelessWidget {
  final double currentSearchPercent;

  const SearchMenuWidget({Key key, this.currentSearchPercent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return currentSearchPercent != 0
        ? Positioned(

            bottom: realH(58 + (144 - 58) * currentSearchPercent),
            left: realW((screenWidth - 320) / 2),
            width: realW(320),
            height: realH(60),
            child: Opacity(
                opacity: currentSearchPercent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: realW(20.0)),
                  child: Row(
                    children: <Widget>[
                      _buildSearchMenuItem(Icons.home, "Donors"),
                      Padding(
                        padding: EdgeInsets.only(left: realW(16)),
                      ),
                      _buildSearchMenuItem(Icons.local_hospital, "Banks")
                    ],
                  ),
                )),
          )
        : const Padding(
            padding: const EdgeInsets.all(0),
          );
  }

  _buildSearchMenuItem(IconData icon, String text) {
    return Expanded(
        child: Container(
      width: realW(130),
      height: realH(60),
      padding: EdgeInsets.only(left: realW(17)),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: realW(30),
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: realW(12)),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: realW(18)),
          )
        ],
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Colors.redAccent,
          Colors.red,
        ]),
        borderRadius: BorderRadius.all(Radius.circular(realW(30))),
      ),
    ));
  }
}
