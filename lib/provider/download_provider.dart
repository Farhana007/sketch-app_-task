import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';

class CanvasImageDownload extends ChangeNotifier {
  GlobalKey? canvasKey;

  CanvasImageDownload({required this.canvasKey});

  Future<void> saveCanvasImage(BuildContext context) async {
    try {
      // Request storage permission
      PermissionStatus status = await Permission.storage.request();

      // Check if permission is granted
      if (status.isGranted) {
        if (canvasKey == null) {
          throw Exception("Canvas key is null.");
        }

        await Future.delayed(Duration(milliseconds: 20)); // Delay for one frame

        if (canvasKey!.currentContext == null) {
          throw Exception("Canvas context is null.");
        }

        final boundary = canvasKey!.currentContext!.findRenderObject()
            as RenderRepaintBoundary;
        final image = await boundary.toImage(pixelRatio: 3.0);
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

        if (byteData == null) {
          throw Exception("Failed to encode image data.");
        }

        final imageData = byteData.buffer.asUint8List();
        await ImageGallerySaver.saveImage(imageData);

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image saved successfully'),
          ),
        );
      } else {
        throw Exception("Storage permission denied.");
      }
    } catch (e) {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save image: $e'),
        ),
      );
      print("Error saving image: $e");
    }
  }
}
