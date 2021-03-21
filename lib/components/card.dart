import 'package:flutter/material.dart';


class InfoCard extends StatelessWidget {

  const InfoCard({
    Key key,
    @required this.titleText,
    @required this.titleColor,
    @required this.dataText,
    @required this.dataColor,
  }) : super(key: key);

  final String titleText;
  final Color titleColor;
  final String dataText;
  final Color dataColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(

                children: <Widget>[
                  Text(
                    titleText,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    dataText,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: dataColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}