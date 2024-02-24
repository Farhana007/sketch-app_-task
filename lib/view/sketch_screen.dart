import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sketch_app/view/canvas.dart';
import 'package:velocity_x/velocity_x.dart';
import '../provider/sketch_provider.dart';
import '../utils/color_change_function.dart';
import '../utils/stroke_change_function.dart';

class SketchScreen extends StatelessWidget {
  const SketchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightCount = MediaQuery.sizeOf(context).height;
    double widthCount = MediaQuery.sizeOf(context).width;
    final drawingManager =
        Provider.of<DrawingStateManager>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: "Sketch your thought out".text.white.make()),
                10.heightBox,
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              drawingManager.undo();
                            },
                            icon: const Icon(
                              Icons.undo,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              drawingManager.redo();
                            },
                            icon: const Icon(
                              Icons.redo,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              drawingManager.clearCanvas();
                            },
                            icon: const Icon(
                              CupertinoIcons.clear_circled,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              showColorPickerDialog(context);
                            },
                            icon: const Icon(
                              Icons.color_lens_rounded,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              showStrokeWidthDialog(context);
                            },
                            icon: const Icon(
                              CupertinoIcons.circle,
                              color: Colors.white,
                            )),
                      ],
                    )
                        .box
                        .size(widthCount * 0.25, heightCount * 0.9)
                        .color(const Color.fromARGB(255, 67, 47, 131))
                        .make(),
                    const SketchingCanvas()
                        .box
                        .size(widthCount * 0.7, heightCount * 0.9)
                        .white
                        .make(),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
