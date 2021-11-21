import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/src/application/store.dart';

class SaAndroidApp extends StatelessWidget {
  final SaStore _store;

  const SaAndroidApp({Key? key, required SaStore store})
      : _store = store,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: '/',
        routes: {
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
          '/search': (context) {
            return SaSearch();
          }
        },
      ),
    );
  }
}

class SaSearch extends StatelessWidget {
  const SaSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SaPost extends StatelessWidget {
  final String state;
  final void Function(String state) onSelectName;
  final void Function(String state) onSelectProfile;
  final void Function(String state) onLike;
  final void Function(String state) onShare;
  final void Function(String state) onBookmark;
  final void Function(String state) onSelectViews;
  final void Function(String state) onSelectMore;
  final void Function(String state) onSelectComments;
  final void Function(String state) onFollow;
  final void Function(String state) onSelectOptions;

  const SaPost(
    this.state, {
    Key? key,
    required this.onSelectName,
    required this.onSelectProfile,
    required this.onLike,
    required this.onShare,
    required this.onBookmark,
    required this.onSelectViews,
    required this.onSelectMore,
    required this.onSelectComments,
    required this.onFollow,
    required this.onSelectOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orange,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'fgaudo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        Container(
          height: 300,
          child: SvgPicture.network(
            'https://upload.wikimedia.org/wikipedia/commons/1/11/Test-Logo.svg',
          ),
          color: Colors.grey.shade200,
        )
      ],
    );
  }
}

class SaStory extends StatelessWidget {
  final String state;
  final void Function(String state) onSelect;

  const SaStory(
    this.state, {
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.red.shade400,
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}

class SaHome extends StatelessWidget {
  final void Function(int) loadPages;
  final void Function() loadStories;

  final Widget Function(String something) postBuilder;
  final Widget Function(String something) storyBuilder;

  final void Function() onProfileTap;
  final void Function() onSearchTap;
  final void Function() onMediaTap;
  final void Function() onStoreTap;

  const SaHome({
    Key? key,
    required this.loadPages,
    required this.storyBuilder,
    required this.postBuilder,
    required this.loadStories,
    required this.onProfileTap,
    required this.onSearchTap,
    required this.onMediaTap,
    required this.onStoreTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text('Social App', style: GoogleFonts.pacifico()),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, elem) {
            if (elem == 0) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                child: ListView.separated(
                  separatorBuilder: (context, item) => SizedBox(width: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, elem) => Padding(
                    padding: EdgeInsets.all(0),
                    child: storyBuilder(''),
                  ),
                ),
              );
            }
            return postBuilder('');
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home,
              size: 30,
            ),
            IconButton(
              icon: Icon(Icons.search_outlined),
              iconSize: 30,
              onPressed: onSearchTap,
            ),
            IconButton(
              icon: Icon(Icons.video_collection_outlined),
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              iconSize: 30,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
