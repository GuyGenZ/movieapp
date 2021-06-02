import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gxmovie/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Athiti"),
      home: IndexScreen(),
    );
  }
}

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int menuindex;
  List<Widget> showbody;
  @override
  void initState() {
    super.initState();
    menuindex = 0;
    showbody = [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showbody[menuindex],
      backgroundColor: Color(0xff000313),
      bottomNavigationBar: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => print("home"),
              child: FaIcon(
                FontAwesomeIcons.home,
                color: menuindex == 0 ? Color(0xffbb0000) : Color(0xff8e8e8e),
              ),
            ),
            GestureDetector(
              onTap: () => print("play"),
              child: FaIcon(
                FontAwesomeIcons.solidPlayCircle,
                color: menuindex == 1 ? Color(0xffbb0000) : Color(0xff8e8e8e),
              ),
            ),
            GestureDetector(
              onTap: () => print("search"),
              child: FaIcon(
                FontAwesomeIcons.search,
                color: menuindex == 2 ? Color(0xffbb0000) : Color(0xff8e8e8e),
              ),
            ),
            GestureDetector(
              onTap: () => print("user"),
              child: FaIcon(
                FontAwesomeIcons.solidUser,
                color: menuindex == 3 ? Color(0xffbb0000) : Color(0xff8e8e8e),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
