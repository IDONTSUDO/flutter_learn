import 'package:flutter/material.dart';

import 'custom_route/custom_route.dart';

typedef NavigatorKey = GlobalKey<NavigatorState>;

class CustomNavigator {
  final NavigatorKey _navigatorKey;

  NavigatorState get navigator {
    assert(_navigatorKey.currentState != null);

    return _navigatorKey.currentState!;
  }

  CustomNavigator({
    required NavigatorKey navigatorKey,
  }) : _navigatorKey = navigatorKey;

  Future<T?> popAndPushNamed<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigator.popAndPushNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  void popUntil(RoutePredicate predicate) {
    return navigator.popUntil(predicate);
  }

  void pop<T extends Object?>([T? result]) {
    return navigator.pop(result);
  }

  Future<T?> push<T extends Object?>(Route<T> route) {
    return navigator.push(route);
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) {
    return navigator.pushAndRemoveUntil(
      newRoute,
      predicate,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return navigator.pushNamedAndRemoveUntil(
      newRouteName,
      (route) => false,
      arguments: arguments,
    );
  }

  Future<T?> pushNamed<T extends Object>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<bool> maybePop<T extends Object>([T? result]) {
    return navigator.maybePop(result);
  }

  Future<T?> pushReplacement<T extends Object, TO extends Object>(
    Route<T> newRoute, {
    TO? result,
  }) {
    return navigator.pushReplacement<T, TO>(
      newRoute,
      result: result,
    );
  }

  Future<T?> showCustomDialog<T>({
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    RouteSettings? routeSettings,
  }) {
    assert(_navigatorKey.currentContext != null);

    final _context = _navigatorKey.currentContext!;
    assert(debugCheckHasMaterialLocalizations(_context));

    return push<T>(DialogRoute<T>(
      context: _context,
      builder: builder,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      settings: routeSettings,
    ));
  }

  Future<T?> showModalBottomSheet<T>({
    required WidgetBuilder builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
  }) {
    final context = _navigatorKey.currentContext!;
    assert(debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));

    return push(ModalBottomSheetRoute<T>(
      builder: builder,
      isScrollControlled: isScrollControlled,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      isDismissible: isDismissible,
      modalBarrierColor: barrierColor,
      enableDrag: enableDrag,
      settings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
    ));
  }

  Future<void> showBottomSheetDialog(Widget child) {
    return _showGeneralDialog(
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: anim1,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      },
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return child;
      },
    );
  }

  Future<T?> _showGeneralDialog<T extends Object?>({
    required RoutePageBuilder pageBuilder,
    bool barrierDismissible = false,
    String? barrierLabel,
    Color barrierColor = const Color(0x80000000),
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder? transitionBuilder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
  }) {
    assert(!barrierDismissible || barrierLabel != null);

    return push<T>(RawDialogRoute<T>(
      pageBuilder: pageBuilder,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      settings: routeSettings,
      anchorPoint: anchorPoint,
    ));
  }
}
