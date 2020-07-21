import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_d/screens/StaticWidget.dart';

import '../providers/color.dart';

class BackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<ColorProvider>(
        builder: (_, colorProvider, __) {
          return GestureDetector(
            onHorizontalDragEnd: (DragEndDetails dragEndDetails) {
              if (dragEndDetails.primaryVelocity >= 1000 ||
                  dragEndDetails.primaryVelocity <= -1000) {
                print(colorProvider.generatedColor);
                colorProvider.generateColor();
              }
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorProvider.generatedColor,
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}