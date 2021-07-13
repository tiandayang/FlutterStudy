import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  @override
  ListAnimationState createState() => ListAnimationState();
}

class ListAnimationState extends State<ListAnimation> {
  final GlobalKey<AnimatedListState> globalKey = GlobalKey<AnimatedListState>();
  var index = 5;
  var animationType = 1;

  Widget cell({context, index, animation}) {
    var child = Container(
      height: 100,
      margin: EdgeInsets.only(left: 16, top: 16, right: 16),
      color: Colors.primaries[index],
    );
    var size = SizeTransition(sizeFactor: animation, child: child);
    var scale = ScaleTransition(scale: animation, child: child);
    var fade = FadeTransition(opacity: animation, child: child);

    switch (animationType) {
      case 1:
        return size;
      case 2:
        return scale;
      case 3:
        return fade;
      default:
        return size;
    }
  }

  ///构建 视图
  Widget buildItemWidget(context, index, animation) {
    return cell(context: context, index: index, animation: animation);
  }

  ///删除视图
  Widget removeItemBuilder(BuildContext context, Animation<double> animation) {
    return cell(context: context, index: index, animation: animation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表动画'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {
              index += 1;
              globalKey.currentState.insertItem(index - 1);
            },
          ),
          IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () {
              if (index > 1) {
                index -= 1;
                globalKey.currentState.removeItem(index, removeItemBuilder);
              }
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('展开收起'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('放大缩小'),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text('渐变'),
                  value: 3,
                ),
              ];
            },
            onSelected: (value) {
              animationType = value;
              setState(() {});
            },
          ),
        ],
      ),
      body: AnimatedList(
        key: globalKey,
        itemBuilder: buildItemWidget,
        initialItemCount: index,
      ),
    );
  }
}
