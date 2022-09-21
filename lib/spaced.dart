library spaced;

import 'package:flutter/widgets.dart';

/// Functionally same as [Flex] but with [SizedBox] in between all the children.
///
/// [spacing] will only apply when [MainAxisAlignment] is [MainAxisAlignment.start], [MainAxisAlignment.center] or [MainAxisAlignment.end].
///
/// If you need a scrollable list, consider using [ListView.separated] instead.
class SpacedFlex extends Flex {
  SpacedFlex({
    required this.spacing,
    List<Widget> children = const <Widget>[],
    required super.direction,
    super.mainAxisAlignment,
    super.key,
    super.mainAxisSize = MainAxisSize.max,
    super.crossAxisAlignment = CrossAxisAlignment.center,
    super.textDirection,
    super.verticalDirection = VerticalDirection.down,
    super.textBaseline,
    super.clipBehavior = Clip.none,
  }) : super(
            children: (mainAxisAlignment == MainAxisAlignment.start ||
                        mainAxisAlignment == MainAxisAlignment.center ||
                        mainAxisAlignment == MainAxisAlignment.end) &&
                    children.isNotEmpty
                ? (children
                    .expand((child) => [
                          child,
                          direction == Axis.horizontal
                              ? SizedBox(width: spacing)
                              : SizedBox(height: spacing)
                        ])
                    .toList()
                  ..removeLast())
                : children) {
    if (spacing < 0) throw RangeError.range(spacing, 0, null);
  }

  /// The width or height of the [SizedBox] between each child.
  final double spacing;
}

/// Functionally same as [Column] but with [SizedBox] in between all the children.
///
/// [spacing] will only apply when [MainAxisAlignment] is [MainAxisAlignment.start], [MainAxisAlignment.center] or [MainAxisAlignment.end].
///
/// If you need a scrollable list, consider using [ListView.separated] instead.
class SpacedColumn extends Column {
  SpacedColumn({
    required this.spacing,
    List<Widget> children = const <Widget>[],
    super.mainAxisAlignment,
    super.key,
    super.crossAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
  }) : super(
            children: (mainAxisAlignment == MainAxisAlignment.start ||
                        mainAxisAlignment == MainAxisAlignment.center ||
                        mainAxisAlignment == MainAxisAlignment.end) &&
                    children.isNotEmpty
                ? (children
                    .expand((child) => [child, SizedBox(height: spacing)])
                    .toList()
                  ..removeLast())
                : children) {
    if (spacing < 0) throw RangeError.range(spacing, 0, null);
  }

  /// The height of the [SizedBox] between each child.
  final double spacing;
}

/// Functionally same as [Row] but with [SizedBox] in between all the children.
///
/// [spacing] will only apply when [MainAxisAlignment] is [MainAxisAlignment.start], [MainAxisAlignment.center] or [MainAxisAlignment.end].
///
/// If you need a scrollable list, consider using [ListView.separated] instead.
class SpacedRow extends Row {
  SpacedRow({
    required this.spacing,
    List<Widget> children = const <Widget>[],
    super.mainAxisAlignment,
    super.key,
    super.crossAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
  }) : super(
            children: (mainAxisAlignment == MainAxisAlignment.start ||
                        mainAxisAlignment == MainAxisAlignment.center ||
                        mainAxisAlignment == MainAxisAlignment.end) &&
                    children.isNotEmpty
                ? (children
                    .expand((child) => [child, SizedBox(width: spacing)])
                    .toList()
                  ..removeLast())
                : children) {
    if (spacing < 0) throw RangeError.range(spacing, 0, null);
  }

  /// The width of the [SizedBox] between each child.
  final double spacing;
}
