import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sothuchi_nl/widgets/addnote/addnote_screen.dart';
import 'package:sothuchi_nl/widgets/taboverview/overview_screen.dart';
import 'package:sothuchi_nl/widgets/tabsetting/setting_screen.dart';
import '../../utils/fab_bottom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    //_tabController.animation.addListener(onTabChanged);
  }

  @override
  Widget build(BuildContext context) {
    //(index == 0) ? OverviewScreen() : SettingScreen(),
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: TabBarView(
        controller: _tabController,
        children: [
          OverviewScreen(),
          SettingScreen()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(_createRoute(AddNoteScreen()));
        },
        backgroundColor: Colors.pink[300],
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.blue,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (index) {
          _selectedTab(index);
        },
        items: [
          FABBottomAppBarItem(
              iconData: Icons.account_balance_wallet, text: 'Tổng quan'),
          FABBottomAppBarItem(iconData: Icons.build, text: 'Cài đặt'),
        ],
      ),
    );
  }

  void _selectedTab(int index) {
//    setState(() {
//      this.index = index;
//    });
    _tabController.animateTo(index);
  }
  Route _createRoute(page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }


  void onTabChanged() {
    final aniValue = _tabController.animation.value;
    if (aniValue > 0.5 && index != 1) {
      setState(() {
        index = 1;
      });
    } else if (aniValue <= 0.5 && index != 0) {
      setState(() {
        index = 0;
      });
    }
  }
}
