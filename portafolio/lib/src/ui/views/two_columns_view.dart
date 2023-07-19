import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/content_texts.dart';
import '../../provider/scroll_provider.dart';
import 'package:portafolio/src/ui/widgets/contact_me_widget.dart';
import 'package:portafolio/src/ui/widgets/menu_widget.dart';
import 'package:portafolio/src/ui/widgets/profile_widget.dart';
import 'package:portafolio/src/ui/widgets/proyects_widget.dart';
import 'package:portafolio/src/ui/widgets/resume_widget.dart';
import 'package:portafolio/src/ui/widgets/social_widget.dart';

// ignore: use_key_in_widget_constructors
class TwoColumnsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 70,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 600,
            maxWidth: 1080,
          ),
          child: Row(
            children: [
              Expanded(child: _firstColumn()),
              Expanded(child: _secondColumn(context)),
            ],
          ),
        ),
      ),
    );
  }

  Column _firstColumn() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 47,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          position,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: SizedBox(
            width: 260,
            child: Text(
              intro,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white54,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 225,
          width: 150,
          child: MenuWidget(),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: SocialWidget(),
          ),
        ),
      ],
    );
  }

  Widget _secondColumn(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          controller: scrollProvider.scrollController,
          padding: const EdgeInsets.only(right: 20),
          shrinkWrap: false,
          itemCount: 5,
          itemBuilder: (context, index) {
            return _customWidgetList(index);
          },
        ),
      ),
    );
  }

  Widget _customWidgetList(int index) {
    switch (index) {
      case 0:
        return const ProfileWidget();
      case 1:
        return const Padding(
          padding: EdgeInsets.only(top: 130),
          child: ResumeWidget(),
        );
      case 2:
        return const Padding(
          padding: EdgeInsets.only(top: 130),
          child: ProyectsWidget(),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.only(top: 130),
          child: ContactMeWidget(),
        );
      case 4:
        return const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 30),
          child: LimitedBox(
            maxWidth: 60,
            child: Text(
              footer,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white54,
              ),
            ),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
