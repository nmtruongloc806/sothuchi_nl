

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingScreenState();
  }
}

class SettingScreenState extends State<SettingScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.pink[300], Colors.pink[400], Colors.red[300]],
                        begin: Alignment.topLeft,
                        stops: [0.2, 0.6 ,1.0],
                        tileMode: TileMode.clamp
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("avatar.jpg")
                        ))
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 185),
                  child: Center(
                      child: Text("Nguyễn Mai Trường Lộc",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 35.0),
                  child: SizedBox(width: 40, height: 40, child: Icon(Icons.settings,color: Colors.white,),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Danh mục",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0),),
            ),
            SizedBox(height: 15,),
            _itemCategory(name: "Hạn mức chi",iconData: Icons.access_alarm,color: Colors.blue[400]),
            SizedBox(height: 15,),
            _itemCategory(name: "Hạn mục chi/thu",iconData: Icons.account_balance_wallet,color: Colors.blue[400]),
            SizedBox(height: 15,),
            _itemCategory(name: "Ghi chép định kì",iconData: Icons.add_to_photos,color: Colors.blue[400]),
            SizedBox(height: 15,),
            _itemCategory(name: "Dự thu/ dự chi",iconData: Icons.calendar_view_day,color: Colors.red[400]),
            SizedBox(height: 15,),
            _itemCategory(name: "Cài đặt tài khoản",iconData: Icons.archive,color: Colors.red[400]),
          ],
        ),
      ),
    );
  }

  Widget _itemCategory(
      {@required name, @required iconData, @required color}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 10,),
        ClipOval(
          child: Material(
            color: color, // button color
            child: InkWell(
              //splashColor: Colors.red, // inkwell color
              child: SizedBox(width: 35, height: 35, child: Icon(iconData,color: Colors.white,)),
              onTap: () {},
            ),
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}