import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
