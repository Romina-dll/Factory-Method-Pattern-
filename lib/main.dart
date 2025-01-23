import 'package:factory_method/shap.dart';
import 'package:factory_method/utils.dart';
import 'package:flutter/material.dart';

Shape currentShape = NullShape();

void main() {
  runApp(const MyApp());
}

// ///creating a raised button style for our button
// final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
//   onPrimary: Colors.black87,
//   primary: Colors.grey[300],
//   minimumSize: const Size(88, 36),
//   padding: const EdgeInsets.symmetric(horizontal: 16),
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(2)),
//   ),
// );

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
    return _MyHomePage();
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


