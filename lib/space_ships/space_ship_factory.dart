import 'dart:math';

import 'package:factory_method/space_ships/space_ship.dart';


enum SpaceShipsEnum {MilleniumFalcon , UNSCInfinity , USSEnterprise , Serenity}

class SpaceShipBuildContext {
  late SpaceShipsEnum spaceShipsType;
  late Point position;
  late double width;
  late double height;
  late Point speed;
}

class SpaceShipFactory{
  SpaceShipFactory._();

  static SpaceShip createSpaceShip(SpaceShipBuildContext context){
    late SpaceShip result;

    switch(context.spaceShipsType){
      case SpaceShipsEnum.MilleniumFalcon: {
        result = MilleniumFalcon(context.position, context.height, context.width , context.speed);
      } break;
      case SpaceShipsEnum.UNSCInfinity: {
        result = UNSCInfinity(context.position, context.height, context.width, context.speed);
      } break;
      case SpaceShipsEnum.USSEnterprise: {
        result = USSEnterprise(context.position, context.height, context.width, context.speed);
      } break;
      case SpaceShipsEnum.Serenity: {
        result = Serenity(context.position, context.height, context.width, context.speed);
      } break;
    }
    return result;
  }
}