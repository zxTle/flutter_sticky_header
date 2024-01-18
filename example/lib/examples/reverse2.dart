import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../common.dart';

class ReverseExample2 extends StatelessWidget {
  const ReverseExample2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      reverse: true,
      title: 'Reverse Example',
      slivers: [
        _StickyHeaderList(
          index: 0,
          count: 15,
          height: 70,
        ),
        _StickyHeaderList(index: 1, count: 7),
      ],
    );
  }
}

class _StickyHeaderList extends StatelessWidget {
  const _StickyHeaderList({
    Key? key,
    this.index,
    required this.count,
    this.height = 60,
  }) : super(key: key);

  final int? index;
  final int count;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader.builder(
      builder: (context, state) => Header(
        index: index,
        color: state.isPinned ? Colors.red : Colors.blue,
        height: height,
      ),
      reverse: true,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ListTile(
            leading: CircleAvatar(
              child: Text('$index'),
            ),
            title: Text('List tile #$i'),
          ),
          childCount: count,
        ),
      ),
    );
  }
}
