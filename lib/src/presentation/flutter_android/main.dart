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
            return Scaffold(
              appBar: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                title: Text('Social App', style: GoogleFonts.pacifico()),
              ),
              body: SafeArea(
                child: SaMainView(
                  stories: SaStories(
                    height: 100,
                  ),
                  post: SaPost(),
                  loadPages: (page) {},
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class SaStories extends StatelessWidget {
  final double height;

  const SaStories({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.05),
      child: SizedBox(
        height: height * 0.9,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, elem) => Padding(
            padding: EdgeInsets.all(0),
            child: Container(
              width: 0.9 * height,
              height: 0.9 * height,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.red.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(height * 0.9),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SaPost extends StatelessWidget {
  const SaPost({Key? key}) : super(key: key);

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

class SaMainView extends StatefulWidget {
  final void Function(int) loadPages;
  final Widget stories;
  final Widget post;

  const SaMainView({
    Key? key,
    required this.loadPages,
    required this.stories,
    required this.post,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SaMainViewState();
  }
}

class _SaMainViewState extends State<SaMainView> {
  late int currentPage;
  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    currentPage = 0;
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: 50,
      itemBuilder: (context, elem) {
        if (elem == 0) {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              child: widget.stories);
        }

        return widget.post;
      },
    );
  }
}
