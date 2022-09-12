import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_app/modules/home/home_screen.dart';

import '../modules/new_post/new_post_screen.dart';
import '../modules/profile/profile_screen.dart';

class LayOut extends StatefulWidget {
  const LayOut({Key? key}) : super(key: key);

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  int _currentIndex = 0;
  List<Widget> screens = [HomeScreen(), ProfileScreen()];
  List<String> appBarTitles = ['Home', 'Profile'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[_currentIndex]),
      ),
      body: screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange.withOpacity(.7),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewPostScreen()));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 8.0,
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                width: 35,
              ),
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: _currentIndex == 0 ? Colors.deepOrange : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              const Spacer(),

              //  Spacer(),
              IconButton(
                icon: Icon(
                  Icons.supervised_user_circle,
                  color: _currentIndex == 1 ? Colors.deepOrange : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              const SizedBox(
                width: 35,
              ),
              // The dum
            ],
          ),
        ),
      ),
    );
  }
}
