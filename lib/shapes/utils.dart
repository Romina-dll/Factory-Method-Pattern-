import 'dart:math';

import 'package:factory_method/shapes/shap.dart';
import 'package:factory_method/shapes/shap_factory.dart';
import 'package:flutter/material.dart';

class Utils {
  static Shape generateRandomShape(Size constraints){
    Size margins = const Size(20,20);
    Size radiusMinMax = const Size(4,40);
    Size widthHeightMinMax = const Size(15,100);
    Shape result = NullShape();
    Random rand = Random();

    ShapesEnum shapeType = ShapesEnum.values[Random().nextInt(ShapesEnum.values.length)];
    debugPrint('generating random shape ....');
    debugPrint('generate $shapeType');

    switch (shapeType) {
      case ShapesEnum.rectangle: {
        ///generate random Rectangle
        ///randomly genenrate the position of the origin
        ///which is left the upper corner of the Rectangle
        Point v1 = Point(rand.nextDouble() * (constraints.width - margins.width),
            rand.nextDouble() * (constraints.height - margins.height)
        );

        double width = rand.nextDouble() *
            (widthHeightMinMax.height - margins.width) + widthHeightMinMax.width;
        double height = rand.nextDouble() *
            (widthHeightMinMax.height - widthHeightMinMax.width) + widthHeightMinMax.width;
        ///randomly generate color
        Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

        ///create the Rectangle using the factory method pattern
        ShapeBuildContext context = ShapeBuildContext()
          ..shapeType = shapeType
          ..color = color
          ..vertices = [v1]
          ..width = width
          ..height = height;
        result = ShapeFactory.createShape(context);
      }
      break;

      case ShapesEnum.circle:{
        ///randomly generate radius in the range of [radiusMinMax]
        double radius = rand.nextDouble() * (radiusMinMax.height - radiusMinMax.width)
            + radiusMinMax.width;
        Point v1 = Point(rand.nextDouble() * (constraints.width - margins.width - radius /2),
          rand.nextDouble() * (constraints.height - margins.height)
        );

        ///randomly generate color
        Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

        ///create the Triangle using the factory method pattern
        ShapeBuildContext context = ShapeBuildContext()
          ..shapeType = shapeType
          ..color = color
        ..vertices = [v1]
        ..radius = radius;
        result = ShapeFactory.createShape(context);
      }
      break;

      case ShapesEnum.triangle: {
        Point v1 = Point(rand.nextDouble() * (constraints.width - margins.width),
            rand.nextDouble() * (constraints.height - margins.height));
        Point v2  = Point (rand.nextDouble() * (widthHeightMinMax.height - margins.width - widthHeightMinMax.width),
         rand.nextDouble() * (widthHeightMinMax.width - margins.height));
        Point v3  = Point (rand.nextDouble() * (widthHeightMinMax.height - margins.width ),
            rand.nextDouble() * (widthHeightMinMax.width - margins.height - widthHeightMinMax.width));
        ///randomly generate color
        Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

        ///create the Rectangle using the factory method pattern
        ShapeBuildContext context = ShapeBuildContext()
          ..shapeType = shapeType
          ..color = color
          ..vertices = [v1,v2,v3];
        result = ShapeFactory.createShape(context);
      }
    }
    return result;
  }
}