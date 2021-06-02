import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gxmovie/screens/movie_player/movie_player.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen(
      {Key key,
      this.image,
      this.movieName,
      this.pointofMovie,
      this.timeofMovie,
      this.ageRange})
      : super(key: key);
  final String image;
  final String movieName;
  final double pointofMovie;
  final int timeofMovie;
  final int ageRange;

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState(
      image, movieName, pointofMovie, timeofMovie, ageRange);
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final String image;
  final String movieName;
  final double pointofMovie;
  final int timeofMovie;
  final int ageRange;

  _MovieDetailScreenState(this.image, this.movieName, this.pointofMovie,
      this.timeofMovie, this.ageRange);
  var orientation;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Color(0xff000313),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Icon Back and Icon Share
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
                child: Row(
                  children: [
                    // Icon Back
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(.3),
                        ),
                        child: FaIcon(FontAwesomeIcons.chevronLeft),
                      ),
                    ),
                    Spacer(),
                    // Icon Share
                    GestureDetector(
                      onTap: () => null,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(.3),
                        ),
                        child: FaIcon(FontAwesomeIcons.share),
                      ),
                    ),
                  ],
                ),
              ),
              // Movie Image
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 354,
                  height: 532,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // age range
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.4),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        "$ageRange+",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                    //
                    GestureDetector(
                      onTap: () {
                        // Go to Movie Player
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoviePlayer()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.4),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          "Thriller",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    // pointofMovie
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.4),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidStar,
                            color: Color(0xffffb300),
                            size: 14,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "$pointofMovie",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Movie Title and TimeOfMovie
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "$movieName",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "$timeofMovie\m",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Indicato Line
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 2.5,
                        color: Color(0xffbb0000),
                      ),
                    ],
                  ),
                ),
              ),
              // Custom Continue Button
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffbb0000),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "continue watch".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
