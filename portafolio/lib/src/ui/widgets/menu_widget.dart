import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/menu_model.dart';
import 'package:portafolio/src/provider/scroll_provider.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  late int _selectedItem;
  late int? _hoveredItem;
  late AnimationController _animationController;
  late Animation<double> _animation;
  late List<Shadow> _shadows;
  late List<MenuItem> _menuItems;

  @override
  void initState() {
    super.initState();
    _menuItems = [
      MenuItem(
        title: 'About Me',
        icon: Icons.person,
        // key: a,
      ),
      MenuItem(
        title: 'Experience',
        icon: Icons.document_scanner,
        // key: b,
      ),
      MenuItem(
        title: 'Projects',
        icon: Icons.data_object,
        // key: c,
      ),
      MenuItem(
        title: 'Contact Me',
        icon: Icons.email,
        // key: d,
      ),
    ];
    _selectedItem = 0;
    _hoveredItem = null;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(begin: 50, end: 50).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
      ),
    );
    _shadows = const [
      Shadow(
        blurRadius: 5,
        color: Colors.white,
        offset: Offset.zero,
      ),
      Shadow(
        blurRadius: 10,
        color: Colors.white,
        offset: Offset.zero,
      ),
    ];
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    

    return ListView.builder(
      itemCount: _menuItems.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _animation = Tween<double>(begin: 0, end: 50).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.bounceOut,
                ),
              );
              _selectedItem = index;
              scrollProvider.getSelectedItem(index);
            });
            _animationController.reset();
            _animationController.forward();
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Transform.translate(
                  offset:
                      Offset(_selectedItem == index ? _animation.value : 0, 0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) {
                      setState(() {
                        _hoveredItem = index;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        _hoveredItem = null;
                      });
                    },
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          _menuItems[index].icon,
                          color: _selectedItem == index
                              ? Colors.white
                              : Colors.white54,
                          shadows: _hoveredItem == index ? _shadows : [],
                        ),
                        const SizedBox(width: 15),
                        Text(
                          _menuItems[index].title,
                          style: TextStyle(
                            color: _selectedItem == index
                                ? Colors.white
                                : Colors.white54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            shadows: _hoveredItem == index ? _shadows : [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
