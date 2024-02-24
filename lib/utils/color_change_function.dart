import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../provider/sketch_setting.dart';

showColorPickerDialog(BuildContext context) {
  final drawingSettings = Provider.of<DrawingSettings>(context, listen: false);
  final List<Color> colorOptions = [
    const Color.fromARGB(255, 200, 66, 57),
    const Color.fromARGB(255, 18, 106, 21),
    const Color.fromARGB(255, 19, 32, 43),
    const Color.fromARGB(255, 255, 154, 59),
    const Color.fromARGB(255, 121, 14, 148),
    const Color.fromARGB(255, 176, 39, 39),
    Colors.black,
    Colors.white,
  ];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: "Select Color".text.make(),
        content: SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var color in colorOptions)
                InkWell(
                    onTap: () {
                      drawingSettings.setSelectedColor(color);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container()
                          .box
                          .size(30, 30)
                          .roundedFull
                          .color(color)
                          .make(),
                    )),
            ],
          ),
        ),
      );
    },
  );
}
