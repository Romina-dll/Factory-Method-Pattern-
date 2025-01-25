
import 'dart:math';

import 'package:flutter/material.dart';


abstract class SpaceShip {
  Point _position = Point(0, 0);
  Size _size = Size(0,0);
  String _displayName = 'displayName';
  Point _speed = Point(0,0);

  void drawHiro(Canvas canvas);

  void move(Canvas canvas);

  String get displayName{
    return _displayName;
  }
}

class Serenity extends SpaceShip {
  Serenity(Point position, double height, double width, Point speed){
    _size = Size(width,height);
    _displayName = "Serenity";
    _position = position;
    _speed = speed;
  }

  @override
  void drawHiro(Canvas canvas) {
    var paint = Paint()
      ..color = Colors.pink;
    canvas.drawRect((Offset(_position.x.toDouble(),_position.y.toDouble()) & _size), paint);
  }

  @override
  void move(Canvas canvas) {
    // TODO: implement move
  }
}

class USSEnterprise extends SpaceShip {

  USSEnterprise(Point position, double height, double width, Point speed){
    _size = Size(width,height);
    _displayName = "USSEnterprise";
    _position = position;
    _speed = speed;
  }

  @override
  void drawHiro(Canvas canvas) {
    var paint = Paint()
      ..color = Colors.green;
    canvas.drawRect((Offset(_position.x.toDouble(),_position.y.toDouble()) & _size), paint);
  }

  @override
  void move(Canvas canvas) {
    // TODO: implement move
  }

}

class UNSCInfinity extends SpaceShip {

  UNSCInfinity(Point position, double height, double width, Point speed){
    _size = Size(width,height);
    _displayName = "UNSCInfinity";
    _position = position;
    _speed = speed;
  }

  @override
  void drawHiro(Canvas canvas) {
    var paint = Paint()
        ..color = Colors.red;
    canvas.drawRect((Offset(_position.x.toDouble(),_position.y.toDouble()) & _size), paint);
  }

  @override
  void move(Canvas canvas) {
    // TODO: implement move
  }

}

class MilleniumFalcon extends SpaceShip {

  MilleniumFalcon(Point position, double height, double width, Point speed ){
    _size = Size(width,height);
    _displayName = 'MilleniumFalcon';
    _speed = speed;
    _position = position;
  }

  @override
  void drawHiro(Canvas canvas) {
    var paint = Paint()
      ..color = Colors.blueAccent;
    canvas.drawRect(
        (Offset(20 , 200) & _size),
        paint);
  }

  @override
  void move(Canvas canvas) {
    // canvas.save();
    Path path = Path();
    path.addPolygon(
        [
          Offset(0.0, _position.y.toDouble()),
          Offset(_position.x.toDouble(), _position.y.toDouble())
        ],
        true);
    var paint = Paint()
      ..color = Colors.blueAccent
      ..invertColors = true;
    canvas.drawPath(path, paint);
  }
}

class NullSpace extends SpaceShip {
  NullSpace(){
    _displayName = "null Space";
  }

  @override
  void drawHiro(Canvas canvas) {
    // TODO: implement drawHiro
  }

  @override
  void move(Canvas canvas) {
    // TODO: implement move
  }

}