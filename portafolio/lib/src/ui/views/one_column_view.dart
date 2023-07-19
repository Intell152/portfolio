import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/content_texts.dart';
import '../../provider/scroll_provider.dart';
import '../widgets/contact_me_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/proyects_widget.dart';
import '../widgets/resume_widget.dart';
import '../widgets/social_widget.dart';

// ignore: use_key_in_widget_constructors
class OneColumnContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 600,
            maxWidth: 1080,
          ),
          child: contentColumn(context),
        ),
      ),
    );
  }

  Widget contentColumn(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          controller: scrollProvider.scrollController,          
          itemCount: 9,
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
        return const Text(
          name,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        );
      case 1:
        return const Text(
          position,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
        );
      case 2:
        return const Padding(
          padding: EdgeInsets.only(top: 15),
          child: LimitedBox(
            maxWidth: 60,
            child: Text(
              intro,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white54,
              ),
            ),
          ),
        );
      case 3:
        return const Padding(
          padding: EdgeInsets.only(bottom: 50, top: 30),
          child: SocialWidget(),
        );
      case 4:
        return const ProfileWidget();
      case 5:
        return const Padding(
          padding: EdgeInsets.only(top: 130),
          child: ResumeWidget(),
        );
      case 6:
        return const Padding(
          padding: EdgeInsets.only(top: 130),
          child: ProyectsWidget(),
        );
      case 7:
        return Padding(
          padding: const EdgeInsets.only(top: 130),
          child: ContactMeWidget(),
        );
        case 8:
        return const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 30),
          child: LimitedBox(
            maxWidth: 60,
            child: Text(
              footer,
              textAlign: TextAlign.left,
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
