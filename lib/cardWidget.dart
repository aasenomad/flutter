import 'package:flutter/material.dart';
import 'model.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final List<TileItem> tileItems;

  CardWidget({@required this.title, @required this.tileItems});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Card(
          color: Color(0xFF132435),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 270,
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.lightBlue[300],
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.black,
                        ),
                        onPressed: null),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.lightBlue[300],
              thickness: 0.1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (widget.tileItems.length < 0)
                      ? null
                      : infoWidget(widget.tileItems[0]),
                  verticalBarSeparator(color: Colors.green),
                  (widget.tileItems.length < 1)
                      ? null
                      : tileWidget(widget.tileItems[1]),
                  verticalBarSeparator(color: Colors.red[900]),
                  (widget.tileItems.length < 2)
                      ? null
                      : tileWidget(widget.tileItems[2]),
                  verticalBarSeparator(color: Colors.red[900]),
                  (widget.tileItems.length < 3)
                      ? null
                      : tileWidget(widget.tileItems[3])
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget verticalBarSeparator({Color color}) {
    return Container(color: color, height: 80, width: 4);
  }

  Widget infoWidget(TileItem item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: <Widget>[
          Text(item.topText,
              style: TextStyle(color: Colors.grey[400], fontSize: 10)),
          SizedBox(height: 12),
          Text(item.middleText,
              style: TextStyle(color: Colors.grey[400], fontSize: 10)),
          SizedBox(height: 12),
          Text(item.bottomText,
              style: TextStyle(color: Colors.grey[400], fontSize: 10))
        ],
      ),
    );
  }

  Widget tileWidget(TileItem item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: <Widget>[
          Text(item.topText,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(item.middleText, style: TextStyle(color: Colors.white)),
          SizedBox(height: 5),
          Text(item.bottomText, style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
