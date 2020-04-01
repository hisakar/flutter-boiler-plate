import 'package:flutter/material.dart';

abstract class Controller extends ChangeNotifier {
  GlobalKey<State<StatefulWidget>> globalKey;
  bool _isMounted;

  @mustCallSuper
  Controller() {
    _isMounted = true;
    initListeners();
  }

  @protected
  void initListeners();

  @protected
  void refreshUI() {
    if (_isMounted) {
      notifyListeners();
    }
  }

  @mustCallSuper
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @protected
  State<StatefulWidget> getState() {
    assert(globalKey != null,
        '''The globalkey must be passed to the Controller via initController() from the View before this can be called.
    This is done automatically when the `Controller` is being constructed and this error should not occur.''');

    assert(globalKey.currentState != null,
        '''Make sure you are using the `globalKey` that is built into the `ViewState` inside your `build()` method.
        For example:
        `key: globalKey,` Otherwise, there is no state that the `Controller` could access.''');

    return globalKey.currentState;
  }

  /// Retrieves the [GlobalKey<State<StatefulWidget>>] associated with the [View]
  @protected
  GlobalKey<State<StatefulWidget>> getStateKey() {
    assert(globalKey != null,
        '''The globalkey must be passed to the Controller via initController() from the View before this can be called.
    This is done automatically when the `Controller` is being constructed and this error should not occur. This might be a
    bug with the package. ''');

    return globalKey;
  }

  /// Initializes optional [Controller] variables that can be used for _refreshing and error displaying.
  /// This method is called automatically by the mounted `View`. Do not call.
  void initController(GlobalKey<State<StatefulWidget>> key) {
    globalKey = key;
  }

  /// Retrieves the [BuildContext] associated with the `View`. Will throw an error if initController() was not called prior.
  @protected
  BuildContext get getContext {
    assert(globalKey != null,
        '''The globalkey must be passed to the Controller via initController() from the View before this can be called.
    This is done automatically when the `Controller` is being constructed and this error should not occur.''');

    assert(globalKey.currentContext != null,
        '''Make sure you are using the `globalKey` that is built into the `ViewState` inside your `build()` method.
        For example:
        `key: globalKey,` Otherwise, there is no context that the `Controller` could access.
        ''');

    return globalKey.currentContext;
  }
}
