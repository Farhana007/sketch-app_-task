import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sketch_app/view/canvas.dart';
import 'package:velocity_x/velocity_x.dart';
import '../provider/sketch_provider.dart';
import '../utils/color_change_function.dart';
import '../utils/stroke_change_function.dart';

///@Description:This screen Contains The UI of the app ,
///@param:Theres is no parameters fro this screen
///@function:There are Buttons for Undo, Redo, Clear Canvas, Color Choosing,Width Changing,Download
///Provider as StateMangement

class SketchScreen extends StatelessWidget {
  const SketchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Height and Widht variable
    double heightCount = MediaQuery.sizeOf(context).height;
    double widthCount = MediaQuery.sizeOf(context).width;
    //--->Creating the Instance of Provider to call the functions <--- ///
    final drawingManager =
        Provider.of<DrawingStateManager>(context, listen: false);

    /// --->Scaffold StartS here <--- ///
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: "Sketch your thought out".text.white.make()), //Title
                10.heightBox,
                // --> This Row Contains two part, one contains buttons for cuntion, and another one is canvas <--//
                Row(
                  children: [
                    // --->First Part of the Row <---///
                    Column(
                      children: [
                        /**Button to Undo */
                        IconButton(
                            onPressed: () {
                              drawingManager.undo();
                            },
                            icon: const Icon(
                              Icons.undo,
                              color: Colors.white,
                            )),

                        /**Button to Redo */
                        IconButton(
                            onPressed: () {
                              drawingManager.redo();
                            },
                            icon: const Icon(
                              Icons.redo,
                              color: Colors.white,
                            )),

                        /**Button to Clear Canvas */
                        IconButton(
                            onPressed: () {
                              drawingManager.clearCanvas();
                            },
                            icon: const Icon(
                              CupertinoIcons.clear_circled,
                              color: Colors.white,
                            )),

                        /**Button to Showing Color chosing Dialog*/
                        IconButton(
                            onPressed: () {
                              showColorPickerDialog(context);
                            },
                            icon: const Icon(
                              Icons.color_lens_rounded,
                              color: Colors.white,
                            )),

                        /**Button to Showing  width chossing dialog*/
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
                        .border(
                            color: const Color.fromARGB(255, 49, 4, 63),
                            width: 2)
                        .make(),

                    /// ---> Second part of the Row , THis is the canvas <--- ///
                    const SketchingCanvas()
                        .box
                        .size(widthCount * 0.7, heightCount * 0.9)
                        .white
                        .border(
                            color: const Color.fromARGB(255, 69, 21, 5),
                            width: 2)
                        .make(),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
