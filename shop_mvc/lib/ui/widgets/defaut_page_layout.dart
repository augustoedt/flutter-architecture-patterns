import 'package:flutter/material.dart';

class DefaultPageLayout extends StatelessWidget {
  // final List<Widget> children;
  // final Widget header;
  final Widget child;

  const DefaultPageLayout({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
                padding:
                    EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 60),
                constraints: BoxConstraints(maxWidth: 650),
                child: child),
          ),
        )
    );
  }
}
// return CustomScrollView(
//   slivers: [
//     SliverToBoxAdapter(child: header ?? SizedBox.shrink()),
//     if(header != null ) SliverToBoxAdapter(child: Divider(indent: 20, endIndent: 20)),
//     SliverGrid(
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 175,
//         mainAxisSpacing: 5,
//         crossAxisSpacing: 10,
//         childAspectRatio: 0.7
//       ),
//
//       delegate: SliverChildBuilderDelegate(
//           (_, index){
//             return children[index];
//           }, childCount: children.length
//       ),
//     )
//   ],