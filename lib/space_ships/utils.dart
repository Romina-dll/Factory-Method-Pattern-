
import 'dart:math';

import 'package:factory_method/space_ships/space_ship.dart';
import 'package:factory_method/space_ships/space_ship_factory.dart';
import 'package:flutter/material.dart';

class UtilsSpace {
  static SpaceShip generateRandomSpaceShip(Size constraints) {
    Size widthHeightMinMax = const Size(15 ,100);
    Size margins = const Size(20, 50);
    Random rand = Random();
    SpaceShip result = NullSpace();

    SpaceShipsEnum spaceType = SpaceShipsEnum.values[
      Random().nextInt(SpaceShipsEnum.values.length)
    ];

    debugPrint('generating random Space ship .....');
    debugPrint('generate $spaceType');

    switch (spaceType) {
      case SpaceShipsEnum.MilleniumFalcon: {

        SpaceShipBuildContext context = SpaceShipBuildContext()
            ..speed = Point(100, 200)
            ..width = 100.0
            ..height = 200.0
            ..position = Point(5, 200)
            ..spaceShipsType = spaceType;
        result = SpaceShipFactory.createSpaceShip(context);
      } break;
      case SpaceShipsEnum.UNSCInfinity: {
        Point v1 = Point(
            rand.nextDouble() * (widthHeightMinMax.height - margins.width) + widthHeightMinMax.width,
            rand.nextDouble() * (widthHeightMinMax.height - margins.width) + widthHeightMinMax.width
        );
        SpaceShipBuildContext context = SpaceShipBuildContext()
            ..speed = Point(50, 200)
            ..width = 100.0
            ..height = 100.0
            ..position = v1
            ..spaceShipsType = spaceType;
        result = SpaceShipFactory.createSpaceShip(context);
      } break;
      case SpaceShipsEnum.USSEnterprise: {
        Point v1 = Point(
            rand.nextDouble() * (widthHeightMinMax.height - margins.width) + widthHeightMinMax.width,
            rand.nextDouble() * (widthHeightMinMax.height - margins.width) + widthHeightMinMax.width
        );        SpaceShipBuildContext context = SpaceShipBuildContext()
          ..speed = Point(50, 200)
          ..width = 50.0
          ..height = 100.0
          ..position = v1
          ..spaceShipsType = spaceType;
        result = SpaceShipFactory.createSpaceShip(context);
      } break;
      case SpaceShipsEnum.Serenity: {
        Point v1 = Point(
            rand.nextDouble() * (widthHeightMinMax.height - margins.width) + widthHeightMinMax.width,
            rand.nextDouble() * (widthHeightMinMax.height - margins.width) + widthHeightMinMax.width
        );
        SpaceShipBuildContext context = SpaceShipBuildContext()
          ..speed = Point(50, 200)
          ..width = 250.0
          ..height = 100.0
          ..position = v1
          ..spaceShipsType = spaceType;
        result = SpaceShipFactory.createSpaceShip(context);
      } break;
    }
    return result;
  }
}