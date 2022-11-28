import 'package:flutter/material.dart';

enum Flavor {
  DEV,
  QA,
  PRODUCTION
}

class FlavorValues {
  FlavorValues({required this.baseUrl});
  final String baseUrl;
  //Add other flavor specific values, e.g database name
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;

  
  factory FlavorConfig({
      required Flavor flavor,
      Color color: Colors.blue,
      required FlavorValues values}) {
      return FlavorConfig._internal(flavor, flavor.toString(), color, values);
  }
  
  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);
  bool isProduction() => flavor == Flavor.PRODUCTION;
  bool isDevelopment() => flavor == Flavor.DEV;
  bool isQA() => flavor == Flavor.QA;
}