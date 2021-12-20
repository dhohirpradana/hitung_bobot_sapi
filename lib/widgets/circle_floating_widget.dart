import 'package:flutter/material.dart';

Widget circleFloatingWidget(
        String heroTag, function, Icon icon, Color? color) =>
    RotationTransition(
      turns: const AlwaysStoppedAnimation(90 / 360),
      child: FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: color,
        onPressed: function,
        child: icon,
      ),
    );
