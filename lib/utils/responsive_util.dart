import 'package:flutter/material.dart';

double responsive(context, double size) {
  double appHeight = MediaQuery.sizeOf(context).height;
  double appWidth = MediaQuery.sizeOf(context).width;
  double res = (appHeight + appWidth) * (size / (844.571 + 411.428));
  return res.floorToDouble();
}