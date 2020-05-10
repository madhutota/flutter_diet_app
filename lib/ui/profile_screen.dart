import 'package:flutter/material.dart';
import 'package:flutterdietapp/model/meal.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          iconSize: 35,
          selectedIconTheme:
              IconThemeData(color: Theme.of(context).primaryColor),
          unselectedIconTheme: IconThemeData(color: Colors.black12),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: const TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(
                  'Search',
                  style: const TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: const TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.36,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Date Year',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      subtitle: Text(
                        'Hello Madhu',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      trailing:
                          ClipOval(child: Image.asset("assets/pasta.jpeg")),
                    ),
                    _RadialProgress(
                      height: height * 0.2,
                      width: height * 0.2,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.36,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8, left: 20, right: 15, top: 10),
                    child: Text(
                      'MEALS FOR TODAY',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.blueGrey),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            for (int i = 0; i < meals.length; i++)
                              _MaterialCard(
                                meal: meals[i],
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(


                              colors: [Color(0xFF7CB342), Color(0xFF00C853)])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'YOUR NEXT WORKOUT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'UPPER BODY',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFC5E1A5),
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                  icon: Image.asset(
                                    "assets/noun_strength.png",
                                    height: 30,
                                    width: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFFC5E1A5),
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    "assets/noun_strength.png",
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFFC5E1A5),
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    "assets/noun_strength.png",
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFFC5E1A5),
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    "assets/noun_strength.png",
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

    double relativeProgress = 360 * progress;

    Offset center = Offset(size.height / 2, size.width / 2);
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width;

  const _RadialProgress({Key key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.8),
      child: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('1731',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black
            ),),
            Text('kcal left',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),)
          ],
        ),
      ),
    );
  }
}

class _MaterialCard extends StatelessWidget {
  final Meal meal;

  const _MaterialCard({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 10),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(6),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Image.asset(
                    meal.imagePath,
                    fit: BoxFit.fill,
                  )),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      meal.mealTime,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey),
                    ),
                    Text(
                      meal.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey),
                    ),
                    Text(
                      "${meal.kiloCaloriesBurnt} kcal",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.blueGrey),
                    ),
                    Row(children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.black,
                        size: 14,
                      ),
                      Text(
                        " ${meal.timeTaken} min",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      )
                    ]),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
