import 'package:flutter/material.dart';
import 'package:space_scape_package/space_scape_package.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView>
    with TickerProviderStateMixin {
  bool _stateFlag = false;
  Widget _game = const SizedBox();
  double _width = 0;
  double _height = 0;
  Color _color = Colors.transparent;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //permite usar el context en esta parte
      Future.delayed(const Duration(milliseconds: 500), () {
        _changeContainer(Size(_width, _height), _stateFlag);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context2, BoxConstraints constraints) {
      // Code snippet that is executed when the widget tree is built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          if (_stateFlag) {
            _width = constraints.maxWidth;
            _height = constraints.maxHeight;
          }
        });
      });

      return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 600),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: _color,
          ),
          child: Column(
            children: [
              _createButton(_width),
              _game,
            ],
          ),
          onEnd: () {
            if (_stateFlag) {
              setState(
                () {
                  _game = Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 550,
                        minWidth: 550,
                      ),
                      child: Container(
                        color: Colors.black,
                        width: _width / 1.5,
                        height: _height / 1.1,
                        child: const MyGame(),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      );
    });
  }

  void _changeContainer(Size size, bool small) {
    setState(() {
      if (small) {
        _game = const SizedBox();
        _width = 60.0;
        _height = 60.0;
        _color = Colors.transparent;
        _stateFlag = false;
      } else {
        _width = size.width;
        _height = size.height;
        _color = Colors.black54.withOpacity(0.5);
        _stateFlag = true;
      }
    });
  }

  Widget _createButton(double width) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(_stateFlag == false ? 0.8 : 0.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: _stateFlag
          ? Padding(
              padding: EdgeInsets.only(left: _width / 1.1),
              child: Material(
                elevation: 10,
                child: IconButton(
                  icon: const Icon(Icons.close_fullscreen),
                  onPressed: () {
                    _changeContainer(Size(_width, _height), _stateFlag);
                  },
                ),
              ),
            )
          : Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 10,
                color: Colors.transparent,
                child: IconButton(
                  icon: const Icon(Icons.open_in_full),
                  onPressed: () {
                    _changeContainer(Size(_width, _height), _stateFlag);
                  },
                ),
              ),
            ),
    );
  }
}
