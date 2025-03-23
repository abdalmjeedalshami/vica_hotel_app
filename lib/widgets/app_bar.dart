import 'package:flutter/material.dart';

import '../utils/images.dart';
import '../utils/responsive_util.dart';

AppBar appBar(context) => AppBar(
  backgroundColor: Colors.white,
  elevation: 0,
  actions: [
    Padding(
      padding: EdgeInsets.only(right: responsive(context, 16)),
      child: const CircleAvatar(
        backgroundImage: AssetImage(AppImages.user),
        // User image
        radius: 20,
      ),
    ),
  ],
);