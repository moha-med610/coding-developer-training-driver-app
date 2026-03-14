import 'package:flutter/material.dart';

/// usage
/// context.navigateTo(route);
/// context.navigateAndReplace(route);
/// context.navigateAndRemoveUntil(route);
extension NavigateExtension on BuildContext {
  void navigateTo(Widget route) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => route));
  }

  void navigateAndReplace(Widget route) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => route));
  }

  void navigateAndRemoveUntil(Widget route) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (_) => route),
      (Route<dynamic> route) => false,
    );
  }

  void pop(BuildContext context) => Navigator.pop(context);

  void navigateRouteNamed(String routeName) {
    Navigator.pushNamed(this, routeName);
  }

  void navigateRouteNamedAndRemoveUntil(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void navigateRouteNamedAndReplace(String routeName) {
    Navigator.pushReplacementNamed(this, routeName);
  }
}
