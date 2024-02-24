import 'package:flutter/material.dart';

class DrawingStateManager extends ChangeNotifier {
  final List<Stroke> _strokes = [];
  final List<Stroke> _undoneStrokes = [];
  int _currentIndex = -1;

  List<Stroke> get strokes => _strokes;
  int get currentIndex => _currentIndex;

  void addStroke(List<Offset> newStroke, Color color, double strokeWidth) {
    _strokes
        .add(Stroke(points: newStroke, color: color, strokeWidth: strokeWidth));
    _undoneStrokes.clear();
    _currentIndex = _strokes.length - 1;
    notifyListeners();
  }

  void undo() {
    if (_currentIndex >= 0) {
      _undoneStrokes.add(_strokes.removeLast());
      _currentIndex--;
      notifyListeners();
    }
  }

  void redo() {
    if (_undoneStrokes.isNotEmpty) {
      _strokes.add(_undoneStrokes.removeLast());
      _currentIndex++;
      notifyListeners();
    }
  }

  void clearCanvas() {
    _strokes.clear();
    _undoneStrokes.clear();
    _currentIndex = -1;
    notifyListeners();
  }
}

class Stroke {
  final List<Offset> points;
  final Color color;
  final double strokeWidth;

  Stroke(
      {required this.points, required this.color, required this.strokeWidth});
}
