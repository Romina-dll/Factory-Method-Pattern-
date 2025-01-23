import 'dart:math';

import 'package:factory_method/shap.dart';
import 'package:flutter/material.dart';

///enumeration of available shape ids to be used when calling the factory method
///for shape creation
enum ShapesEnum {rectangle , circle, triangle}

///context data to build shapes
///you will normally add any specific and dependant initialization data in
///here. so for example  if you want to add a Rectangle shape you could add here
///a [width] and [height]
class ShapeBuildContext {
  late Color color;
  late ShapesEnum shapeType;
  late List<Point> vertices;
  late double radius;
  late double width;
  late double height;
}

///shape Factory which follows the factory method pattern (Simplified) so
///that we have a single point of shape instance creation
///we use [ShapesEnum] as a way  to decide which specific shpe implementation
///is asked for and return it
class ShapeFactory{

  ///private constructor to prevent instantiation
  ShapeFactory._();

  ///main factory method to create instatnce of Bullet children
  static Shape createShape(ShapeBuildContext context) {

    ///instance of null we have e NullShape here which follows the Null design pattern (bonus!)
    Shape result = NullShape();

    ///collect all the shape definitions here
    ///each case statement will need to know the specific constructor and
    ///match its initialization to the context data
    ///
    /// <TODO>
    /// it would make sense to add a validation step to ensure for example
    /// that all the vertices for Triangle actually are defined and exist.
    switch(context.shapeType) {
      case ShapesEnum.rectangle: {
        result = Rectangle(context.color, context.vertices[0], context.width, context.height);
      }
      break;
      case ShapesEnum.circle: {
        result = Circle(context.color,context.vertices[0],context.radius);
      }
      break;
      case ShapesEnum.triangle: {
        result = Triangle(context.color, context.vertices[0],context.vertices[1] , context.vertices[2]);
      }
    }
    return result;
  }


}

