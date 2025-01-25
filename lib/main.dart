
import 'package:factory_method/shapes/shap.dart';
import 'package:factory_method/shapes/utils.dart';
import 'package:factory_method/space_ships/space_ship.dart';
import 'package:factory_method/space_ships/utils.dart';
import 'package:flutter/material.dart';

Shape currentShape = NullShape();
SpaceShip currentSpaceShip = NullSpace();
bool SpaceMove = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() {
    // TODO: implement createState
    return _MyHomePage2();
  }
}

class _MyHomePage extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory Mathod Pattern'),
      ),
      body: ListView(
          children: [
            Text('${currentShape.getName}', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),),
            Container(
              width: 400,
              height: 400,
              child: CustomPaint(
                painter: CanvasPainter(),
              ),
            ),
            SizedBox(height: 200,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FloatingActionButton(

                child: Text('Generate new random Shape', style: TextStyle(
                    fontSize: 18),),
                onPressed: (){
                  setState(() {
                    currentShape = Utils.generateRandomShape(Size(400,400));
                  });
                },
              ),
            )
          ],
        ),
      );
  }
}

class _MyHomePage2 extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory Mathod Pattern'),
      ),
      body: ListView(
        children: [
          Text('${currentSpaceShip.displayName}', textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),),
          Container(
            width: 400,
            height: 400,
            child: CustomPaint(
              painter: CanvasPainterSpace(),
            ),
          ),
          SizedBox(height: 200,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                FloatingActionButton(
                  child: Text('Generate new random space ship', style: TextStyle(
                      fontSize: 18),),
                  onPressed: (){
                    setState(() {
                      currentSpaceShip = UtilsSpace.generateRandomSpaceShip(Size(400, 400));
                      // SpaceMove = false;
                    });
                  },
                ),
                // FloatingActionButton(
                //
                //   child: Text('Generate new random space ship', style: TextStyle(
                //       fontSize: 18),),
                //   onPressed: (){
                //     setState(() {
                //       SpaceMove = true;
                //     });
                //   },
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

///our custom painter
///we simply draw the current shape by delegating to its draw(Canvas) method
class CanvasPainter extends CustomPainter {

  void paint(Canvas canvas, Size size){
      currentShape.draw(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class CanvasPainterSpace extends CustomPainter {

  void paint(Canvas canvas, Size size){
    currentSpaceShip.drawHiro(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class CanvasMoveSpace extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    currentSpaceShip.move(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}


