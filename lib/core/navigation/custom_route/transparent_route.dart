import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TransparentRoute<T> extends _TransparentModalRoute<T> {
  final RoutePageBuilder _pageBuilder;
  final RouteTransitionsBuilder? _transitionsBuilder;
  final Duration _transitionDuration;

  TransparentRoute({
    required RoutePageBuilder pageBuilder,
    RouteTransitionsBuilder? transitionsBuilder,
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteSettings? settings,
  })  : _pageBuilder = pageBuilder,
        _transitionsBuilder = transitionsBuilder,
        _transitionDuration = transitionDuration,
        super(settings: settings);

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => 'TransparentRoute';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _pageBuilder(context, animation, secondaryAnimation);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _transitionsBuilder != null
        ? _transitionsBuilder!(context, animation, secondaryAnimation, child)
        : _defaultTransition(context, animation, secondaryAnimation, child);
  }

  Widget _defaultTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  Duration get transitionDuration => _transitionDuration;

  @override
  bool get opaque => false;

  @override
  bool get maintainState => true;
}

abstract class _TransparentModalRoute<T> extends TransitionRoute<T> with LocalHistoryRoute<T> {
  _TransparentModalRoute({
    RouteSettings? settings,
    this.filter,
  }) : super(settings: settings);

  final ui.ImageFilter? filter;

  @optionalTypeArgs
  static _TransparentModalRoute<T>? of<T extends Object?>(BuildContext context) {
    final _ModalScopeStatus? widget =
        context.dependOnInheritedWidgetOfExactType<_ModalScopeStatus>();
    return widget?.route as _TransparentModalRoute<T>?;
  }

  @protected
  void setState(VoidCallback fn) {
    if (_scopeKey.currentState != null) {
      _scopeKey.currentState!._routeSetState(fn);
    } else {
      fn();
    }
  }

  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation);

  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }

  @override
  void install() {
    super.install();
    _animationProxy = ProxyAnimation(super.animation);
    _secondaryAnimationProxy = ProxyAnimation(super.secondaryAnimation);
  }

  @override
  TickerFuture didPush() {
    if (_scopeKey.currentState != null && navigator!.widget.requestFocus) {
      navigator!.focusScopeNode.setFirstFocus(_scopeKey.currentState!.focusScopeNode);
    }
    return super.didPush();
  }

  @override
  void didAdd() {
    if (_scopeKey.currentState != null && navigator!.widget.requestFocus) {
      navigator!.focusScopeNode.setFirstFocus(_scopeKey.currentState!.focusScopeNode);
    }
    super.didAdd();
  }

  bool get barrierDismissible;

  bool get semanticsDismissible => true;

  Color? get barrierColor;

  String? get barrierLabel;

  Curve get barrierCurve => Curves.ease;

  bool get maintainState;

  bool get offstage => _offstage;
  bool _offstage = false;
  set offstage(bool value) {
    if (_offstage == value) return;
    setState(() {
      _offstage = value;
    });
    _animationProxy!.parent = _offstage ? kAlwaysCompleteAnimation : super.animation;
    _secondaryAnimationProxy!.parent =
        _offstage ? kAlwaysDismissedAnimation : super.secondaryAnimation;
    changedInternalState();
  }

  BuildContext? get subtreeContext => _subtreeKey.currentContext;

  @override
  Animation<double>? get animation => _animationProxy;
  ProxyAnimation? _animationProxy;

  @override
  Animation<double>? get secondaryAnimation => _secondaryAnimationProxy;
  ProxyAnimation? _secondaryAnimationProxy;

  final List<WillPopCallback> _willPopCallbacks = <WillPopCallback>[];

  @override
  Future<RoutePopDisposition> willPop() async {
    final _ModalScopeState<T>? scope = _scopeKey.currentState;
    assert(scope != null);
    for (final WillPopCallback callback in List<WillPopCallback>.of(_willPopCallbacks)) {
      if (await callback() != true) return RoutePopDisposition.doNotPop;
    }
    return super.willPop();
  }

  void addScopedWillPopCallback(WillPopCallback callback) {
    assert(_scopeKey.currentState != null,
        'Tried to add a willPop callback to a route that is not currently in the tree.');
    _willPopCallbacks.add(callback);
  }

  void removeScopedWillPopCallback(WillPopCallback callback) {
    assert(_scopeKey.currentState != null,
        'Tried to remove a willPop callback from a route that is not currently in the tree.');
    _willPopCallbacks.remove(callback);
  }

  @protected
  bool get hasScopedWillPopCallback {
    return _willPopCallbacks.isNotEmpty;
  }

  @override
  void didChangePrevious(Route<dynamic>? previousRoute) {
    super.didChangePrevious(previousRoute);
    changedInternalState();
  }

  @override
  void changedInternalState() {
    super.changedInternalState();
    setState(() {});
    _modalScope.maintainState = maintainState;
  }

  @override
  void changedExternalState() {
    super.changedExternalState();
    if (_scopeKey.currentState != null) _scopeKey.currentState!._forceRebuildPage();
  }

  bool get canPop => hasActiveRouteBelow || willHandlePopInternally;

  final GlobalKey<_ModalScopeState<T>> _scopeKey = GlobalKey<_ModalScopeState<T>>();
  final GlobalKey _subtreeKey = GlobalKey();
  final PageStorageBucket _storageBucket = PageStorageBucket();

  Widget? _modalScopeCache;

  Widget _buildModalScope(BuildContext context) {
    return _modalScopeCache ??= Semantics(
      sortKey: const OrdinalSortKey(0.0),
      child: _ModalScope<T>(
        key: _scopeKey,
        route: this,
      ),
    );
  }

  late OverlayEntry _modalScope;

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return <OverlayEntry>[
      _modalScope = OverlayEntry(builder: _buildModalScope, maintainState: maintainState),
    ];
  }
}

class _ModalScopeStatus extends InheritedWidget {
  const _ModalScopeStatus({
    required this.isCurrent,
    required this.canPop,
    required this.route,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final bool isCurrent;
  final bool canPop;
  final Route<dynamic> route;

  @override
  bool updateShouldNotify(_ModalScopeStatus old) {
    return isCurrent != old.isCurrent || canPop != old.canPop || route != old.route;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description
        .add(FlagProperty('isCurrent', value: isCurrent, ifTrue: 'active', ifFalse: 'inactive'));
    description.add(FlagProperty('canPop', value: canPop, ifTrue: 'can pop'));
  }
}

/// All code below was copied from `routers.dart` because it's private and we cannot import it
///
class _ModalScope<T> extends StatefulWidget {
  const _ModalScope({
    required this.route,
    Key? key,
  }) : super(key: key);

  final _TransparentModalRoute<T> route;

  @override
  _ModalScopeState<T> createState() => _ModalScopeState<T>();
}

class _ModalScopeState<T> extends State<_ModalScope<T>> {
  Widget? _page;
  late Listenable _listenable;
  final FocusScopeNode focusScopeNode = FocusScopeNode(debugLabel: '$_ModalScopeState Focus Scope');
  final ScrollController primaryScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final List<Listenable> animations = <Listenable>[
      if (widget.route.animation != null) widget.route.animation!,
      if (widget.route.secondaryAnimation != null) widget.route.secondaryAnimation!,
    ];
    _listenable = Listenable.merge(animations);
    if (widget.route.isCurrent && _shouldRequestFocus) {
      widget.route.navigator!.focusScopeNode.setFirstFocus(focusScopeNode);
    }
  }

  @override
  void didUpdateWidget(_ModalScope<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.route == oldWidget.route);
    if (widget.route.isCurrent && _shouldRequestFocus) {
      widget.route.navigator!.focusScopeNode.setFirstFocus(focusScopeNode);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _page = null;
  }

  void _forceRebuildPage() {
    setState(() {
      _page = null;
    });
  }

  @override
  void dispose() {
    focusScopeNode.dispose();
    super.dispose();
  }

  bool get _shouldIgnoreFocusRequest {
    return widget.route.animation?.status == AnimationStatus.reverse ||
        (widget.route.navigator?.userGestureInProgress ?? false);
  }

  bool get _shouldRequestFocus {
    return widget.route.navigator!.widget.requestFocus;
  }

  void _routeSetState(VoidCallback fn) {
    if (widget.route.isCurrent && !_shouldIgnoreFocusRequest && _shouldRequestFocus) {
      widget.route.navigator!.focusScopeNode.setFirstFocus(focusScopeNode);
    }
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.route.restorationScopeId,
      builder: (BuildContext context, Widget? child) {
        assert(child != null);
        return RestorationScope(
          restorationId: widget.route.restorationScopeId.value,
          child: child!,
        );
      },
      child: _ModalScopeStatus(
        route: widget.route,
        isCurrent: widget.route.isCurrent,
        canPop: widget.route.canPop,
        child: Offstage(
          offstage: widget.route.offstage,
          child: PageStorage(
            bucket: widget.route._storageBucket,
            child: Builder(
              builder: (BuildContext context) {
                return Actions(
                  actions: <Type, Action<Intent>>{
                    DismissIntent: _DismissModalAction(context),
                  },
                  child: PrimaryScrollController(
                    controller: primaryScrollController,
                    child: FocusScope(
                      node: focusScopeNode,
                      child: FocusTrap(
                        focusScopeNode: focusScopeNode,
                        child: RepaintBoundary(
                          child: AnimatedBuilder(
                            animation: _listenable,
                            builder: (BuildContext context, Widget? child) {
                              return widget.route.buildTransitions(
                                context,
                                widget.route.animation!,
                                widget.route.secondaryAnimation!,
                                AnimatedBuilder(
                                  animation:
                                      widget.route.navigator?.userGestureInProgressNotifier ??
                                          ValueNotifier<bool>(false),
                                  builder: (BuildContext context, Widget? child) {
                                    final bool ignoreEvents = _shouldIgnoreFocusRequest;
                                    focusScopeNode.canRequestFocus = !ignoreEvents;
                                    return IgnorePointer(
                                      ignoring: ignoreEvents,
                                      child: child,
                                    );
                                  },
                                  child: child,
                                ),
                              );
                            },
                            child: _page ??= RepaintBoundary(
                              key: widget.route._subtreeKey,
                              child: Builder(
                                builder: (BuildContext context) {
                                  return widget.route.buildPage(
                                    context,
                                    widget.route.animation!,
                                    widget.route.secondaryAnimation!,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _DismissModalAction extends DismissAction {
  _DismissModalAction(this.context);

  final BuildContext context;

  @override
  bool isEnabled(DismissIntent intent) {
    final _TransparentModalRoute<dynamic> route = _TransparentModalRoute.of<dynamic>(context)!;
    return route.barrierDismissible;
  }

  @override
  Object invoke(DismissIntent intent) {
    return Navigator.of(context).maybePop();
  }
}
