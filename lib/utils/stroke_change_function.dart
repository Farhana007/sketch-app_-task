import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../provider/sketch_setting.dart';

showStrokeWidthDialog(BuildContext context) {
  final drawingSettings = Provider.of<DrawingSettings>(context, listen: false);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: "Change Stroke Width".text.size(15).make(),
        content: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Slider(
                value: drawingSettings.strokeWidth,
                min: 1,
                max: 11,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    drawingSettings.setStrokeWidth(value);
                  });
                },
              ),
            );
          },
        ),
        actions: <Widget>[
          TextButton(
            child: "OK"
                .text
                .white
                .makeCentered()
                .box
                .size(100, 30)
                .roundedSM
                .shadowSm
                .black
                .makeCentered(),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
