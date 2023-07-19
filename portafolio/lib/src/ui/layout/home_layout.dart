import 'package:flutter/material.dart';

import '../views/one_column_view.dart';
import '../views/two_columns_view.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return (constraints.maxWidth < 1000)
                ? OneColumnContent()
                : TwoColumnsContent();
          },
        ),
      ),
    );
  }
}