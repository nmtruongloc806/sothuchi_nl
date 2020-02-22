import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sothuchi_nl/models/statistical.dart';
import 'package:sothuchi_nl/utils/shape_clipper.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class OverviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OverviewScreenState();
  }
}

class OverviewScreenState extends State<OverviewScreen> {

  List<charts.Series<Statistical, String>> series = [
    charts.Series(
        id: "Subscribers",
        data: Statistical.getDataExample(),
        domainFn: (Statistical statistical, _) => statistical.day,
        measureFn: (Statistical statistical, _) => statistical.total,
        colorFn: (Statistical statistical, _) => statistical.barColor)
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double heightHeader = 230;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _headerwidget(width, heightHeader),
          Container(
            padding: const EdgeInsets.only(left: 5, top: 5),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Tình hình thu chi",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200.0),
                    child: charts.BarChart(series, animate: true))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: width,
            padding: const EdgeInsets.only(left: 5, top: 5),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Tài khoản",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                _itemTaiKhoan(
                    ten: "Ví tiền",
                    soTien: "100tr",
                    imageName: "wallet.png",
                    color: Colors.blue[300]),
                _itemTaiKhoan(
                    ten: "TPBank",
                    soTien: "100tr",
                    imageName: "bank.png",
                    color: Colors.blue[300]),
                _itemTaiKhoan(
                    ten: "TPBank Visa",
                    soTien: "100tr",
                    imageName: "visa.png",
                    color: Colors.blue[300])
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _headerwidget(width, height) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        ClipPath(
          clipper: BottomShapeClipper(),
          child: Container(
            height: height,
            color: Colors.pink[300],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Text(
                "Tổng quan",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
          child: Container(
            width: width,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Tôi",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "1tr",
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Tiền tiết kiệm",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "1tr",
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Em yêu",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "1tr",
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _itemTaiKhoan(
      {@required ten, @required soTien, @required imageName, @required color}) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.only(left: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
              width: 40.0,
              height: 40.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  image: new DecorationImage(image: AssetImage(imageName)))),
          SizedBox(
            width: 15.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                ten,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                soTien,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
