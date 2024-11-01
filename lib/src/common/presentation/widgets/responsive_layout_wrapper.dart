// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveLayoutWrapper extends StatelessWidget {
  final ScreenBreakpoints? breakpoints;
  final Widget Function(BuildContext context)? mobile;
  final Widget Function(BuildContext context)? desktop;
  final Widget Function(BuildContext context)? tablet;

  const ResponsiveLayoutWrapper({super.key, this.mobile, this.desktop, this.tablet, this.breakpoints});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: breakpoints,
      mobile: mobile,
      desktop: desktop,
      tablet: tablet ?? desktop,
    );
  }
}
