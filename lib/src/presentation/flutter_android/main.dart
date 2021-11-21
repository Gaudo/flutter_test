import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/src/application/store.dart';
import 'package:social_app/src/presentation/flutter_android/home/main.dart';
import 'package:social_app/src/presentation/flutter_android/home/post.dart';
import 'package:social_app/src/presentation/flutter_android/search/main.dart';

import 'home/story.dart';

class SaAndroidApp extends StatelessWidget {
  final SaStore store;

  const SaAndroidApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        /****** HOME ******/

        '/': (context) {
          return SaHome(
            loadPages: (index) {},
            loadStories: () {},
            postBuilder: (state) => SaPost(
              state,
              onSelectName: (state) {},
              onSelectProfile: (state) {},
              onBookmark: (String state) {},
              onFollow: (String state) {},
              onLike: (String state) {},
              onSelectComments: (String state) {},
              onSelectMore: (String state) {},
              onSelectOptions: (String state) {},
              onSelectViews: (String state) {},
              onShare: (String state) {},
            ),
            storyBuilder: (state) => SaStory(
              state,
              onSelect: (String state) {},
            ),
            onMediaTap: () {},
            onProfileTap: () {},
            onSearchTap: () {},
            onStoreTap: () {},
          );
        },

        /****** SEARCH ******/

        '/search': (context) {
          return SaSearch();
        }
      },
    );
  }
}
