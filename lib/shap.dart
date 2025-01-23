import 'dart:math';
import 'package:flutter/material.dart';

///abstract class which stipulates the contract for all shapes
///we specify the following:
///[color] which is the border color
///[name] is the name that can be printed for the shape in debugging
///[vertices] is a list of relevant vertices for example a circle could
///use a single vertex to specify the middle of a circle, but a triangle
///could use 3 vertices  to describe the triangle as a polygon etc ...
abstract class Shape {
  Color _color = Colors.amber;
  String _name = "Shape";
  List<Point> _vertices = <Point> [];

  ///this will paint the shape on the supplied canvas
  void draw(Canvas canvas);

  /// this will return the computed area of the shape
  double getArea();

  /// _color getter
  Color get getColor {
    return _color;
  }

  /// _name getter
  String get getName {
    return _name;
  }
}

/// derived Rectangle shape
///
/// we added [width] and [height] for ease of representation
/// We utilize the input Point as the upper left corner of our rectangle and we
/// calculate the other vertices accordingly. NOTE: this is not currently
/// necessary but we did that as a way of showing that a more generalized
/// rectanglke defintiion could be provided without width and height in the
/// future.
class Rectangle extends Shape {
  late double _width;
  late double _height;

  /// default constructor
  /// NOTE: there are no optional vales but we could make the color
  /// optional for example.
  Rectangle(Color color, Point position, double width, double height){
    _color = color;
    _name = "Rectangle";
    _width = width;
    _height = height;
    _vertices.add(position);
    _vertices.add(Point(position.x + width, position.y));
    _vertices.add(Point(position.x,position.y - _height));
    _vertices.add(Point(position.x + width, position.y - height));
  }

  ///draw the rectangle on the supplied canvas
  @override
  void draw(Canvas canvas) {
    var paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawRect(
        (Offset(_vertices[0].x.toDouble(), _vertices[0].y.toDouble())
        & Size(_width, _height)),
        paint
    );
  }

  @override
  double getArea() {
    return _width * _height;
  }
}

class Circle extends Shape {
  late double _radius;

  ///default constructor
  ///NOTE: there are no optional values but we could bake the color optional for example
  Circle(Color color, Point position, double radius){
    _color = color;
    _name = "Circle";
    _radius = radius;
    _vertices.add(position);
  }

  @override
  void draw(Canvas canvas) {
    var paint = Paint()
        ..color = _color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;
    canvas.drawCircle(
    Offset(_vertices[0].x.toDouble(), _vertices[0].y.toDouble()),
    _radius,
    paint);
  }

  @override
  double getArea() {
    return 2 * pi * _radius;
  }

}

class Triangle extends Shape {

  ///default constructor
  ///Note: there are no optional values but we could make the color
  ///optional for example
  Triangle(Color color, Point v1, Point v2, Point v3) {
    _color = color;
    _name = "Triangle";
    _vertices.add(v1);
    _vertices.add(v2);
    _vertices.add(v3);
  }

  ///currently just a place-holder
  ///can be expended upon in later version
  @override
  void draw(Canvas canvas) {
    var paint = Paint()
        ..color = _color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;
    canvas.drawPath(getTrianglePath(_vertices[0].x.toDouble(),_vertices[0].y.toDouble()), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  /// calculates the area of the triangle (I mean obviously) from the vertices
  /// Simple coordinate geometry formula used here:
  /// https://sciencing.com/area-triangle-its-vertices-8489292.html
  @override
  double getArea() {
    Point v1 = _vertices[0];
    Point v2 = _vertices[1];
    Point v3 = _vertices[2];
    num area;
    area = v1.x * (v2.y - v3.y) + v2.x * (v3.y - v1.y) + v3.x * (v1.y - v2.y);
    return area.toDouble();
  }


}

///a Null-Design pattern implementation of a shape
///This is basically just a do-nothing shape placeholder
class NullShape extends Shape {

  ///default constructor
  NullShape(){
    _name = "NullShape";
  }

  /// currently just a place-holder
  /// can be expanded upon in later versions
  @override
  void draw(Canvas canvas) {
    // TODO: implement draw
  }

  @override
  double getArea() {
    return 0.0;
  }


}
















