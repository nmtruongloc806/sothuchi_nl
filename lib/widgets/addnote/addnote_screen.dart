import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddNoteScreenState();
  }
}

class AddNoteScreenState extends State<AddNoteScreen> {
  var _comboboxData = [
    'Chi tiền',
    'Thu tiền',
    'Cho vay',
    'Đi vay',
    'Chuyển khoản'
  ];

  var _comboboxSelected = "Chi tiền";

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: width,
            color: Colors.blue[500],
            child: Center(
              child: Container(
                width: 200,
                height: 50,
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(width: 1, color: Colors.white)),
                child: Center(
                  child: Theme(
                    data: Theme.of(context).copyWith(canvasColor: Colors.blue[300]),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: Icon(
                          // Add this
                          Icons.arrow_drop_down, // Add this
                          color: Colors.white, // Add this
                        ),
                        items: _comboboxData.map((String comboboxItem) {
                          return DropdownMenuItem<String>(
                            value: comboboxItem,
                            child: Text(
                              comboboxItem,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                          );
                        }).toList(),
                        value: _comboboxSelected,
                        onChanged: (String value) {
                          setState(() {
                            _comboboxSelected = value;
                          });
                        },
                        style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            decorationColor: Colors.blue[300]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          )
        ],
      ),
    );
  }
}
