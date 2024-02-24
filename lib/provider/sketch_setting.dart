import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Define DrawingSettings class
class DrawingSettings extends ChangeNotifier {
  Color _selectedColor = Colors.black;
  double _strokeWidth = 5.0;

  Color get selectedColor => _selectedColor;
  double get strokeWidth => _strokeWidth;

  void setSelectedColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void setStrokeWidth(double width) {
    _strokeWidth = width;
    notifyListeners();
  }
}
