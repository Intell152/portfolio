import 'package:flutter/material.dart';


class ScrollProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  late int _selectedItem = 0;
  final List<double> sizeList = [1000, 400, 900, 1500];
  
  int get selectedItem => _selectedItem;

  void getSelectedItem(int item) {
    _selectedItem = item;
    double itemExtent = sizeList[item];
    final double offset = itemExtent * item;

    scrollController.animateTo(
      offset,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
