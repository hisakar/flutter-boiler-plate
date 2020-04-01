import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

abstract class ViewState<Page extends View, Con extends Controller>
    extends State<Page> {

  final GlobalKey<State<StatefulWidget>> globalKey =
      GlobalKey<State<StatefulWidget>>();
  Con _controller;
  Con get controller => _controller;
  ViewState(this._controller) {
    _controller.initController(globalKey);
  }

  Widget buildPage();

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Con>.value(
        value: _controller,
        child: Consumer<Con>(builder: (ctx, con, _) {
          _controller = con;
          return buildPage();
        }));
  }

  @override
  @mustCallSuper
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

abstract class View extends StatefulWidget {
  final Key key;
  View({this.key}) : super(key: key);
}
