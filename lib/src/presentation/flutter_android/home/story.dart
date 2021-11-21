import 'package:flutter/material.dart';

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
