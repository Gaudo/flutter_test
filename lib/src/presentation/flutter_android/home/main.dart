import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
