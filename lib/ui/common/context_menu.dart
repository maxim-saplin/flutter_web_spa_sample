import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContextMenu extends StatelessWidget {
  static const padding = 4.0;

  ContextMenu(
      {required this.children, required this.width, required this.position});

  final List<PreferredSizeWidget> children;
  final double width;
  final Offset position;

  double get totalHeight {
    var height = padding * 2;

    for (var child in children) {
      height += child.preferredSize.height;
    }

    return height;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      double? left = position.dx;
      double? top = position.dy;
      double? right;
      double? bottom;

      if (left + width > constrains.maxWidth) {
        if (left > width) {
          right = constrains.maxWidth - left;
          left = null;
        } else {
          left = constrains.maxWidth - width;
          if (left < 0) {
            left = 0;
          }
        }
      }

      var height = totalHeight;
      if (top + height > constrains.maxHeight) {
        if (top > height) {
          bottom = constrains.maxHeight - top;
          top = null;
        } else {
          top = constrains.maxHeight - height;
          if (top < 0) {
            top = 0;
          }
        }
      }

      return Stack(
        children: [
          Positioned(
            left: left,
            top: top,
            right: right,
            bottom: bottom,
            child: ContextMenuBackground(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(padding),
                  constraints: BoxConstraints(
                    maxWidth: width,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class ContextMenuItem extends StatefulWidget with PreferredSizeWidget {
  ContextMenuItem({
    required this.content,
    this.trailing,
    this.onTap,
    this.autoClose = true,
    this.enabled = true,
    double height = 24,
  }) : preferredSize = Size.fromHeight(height);

  final Widget content;
  final Widget? trailing;
  final void Function()? onTap;
  final bool autoClose;
  final Size preferredSize;
  final bool enabled;

  @override
  _ContextMenuItemState createState() => _ContextMenuItemState();
}

class _ContextMenuItemState extends State<ContextMenuItem> {
  var isHovering = false;
  var isBlinking = false;

  Color get backgroundColor {
    return isHovering && !isBlinking
        ? Color.fromARGB(255, 0, 94, 183)
        : Colors.transparent;
  }

  Color get textColor {
    if (!widget.enabled) {
      return Colors.grey;
    }

    return isHovering && !isBlinking ? Colors.white : Colors.black;
  }

  Color get trailingTextColor {
    return isHovering && !isBlinking ? Colors.white : Color(0x706A6A6A);
  }

  @override
  Widget build(BuildContext context) {
    final trailing = widget.trailing;

    return GestureDetector(
      onTapUp: (details) {
        if (widget.enabled) {
          onTap();
        }
      },
      onSecondaryTapUp: (details) {
        if (widget.enabled) {
          onTap();
        }
      },
      child: MouseRegion(
        onEnter: (event) {
          if (widget.enabled) {
            setState(() => isHovering = true);
          }
        },
        onExit: (event) {
          if (widget.enabled) {
            setState(() => isHovering = false);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                child: widget.content,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                ),
              ),
              if (trailing != null)
                DefaultTextStyle(
                  child: trailing,
                  style: TextStyle(
                    fontSize: 14,
                    color: trailingTextColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap() async {
    setState(() => isBlinking = true);
    await Future.delayed(Duration(milliseconds: 85));
    setState(() => isBlinking = false);
    await Future.delayed(Duration(milliseconds: 85));
    widget.onTap?.call();
    if (widget.autoClose) Navigator.of(context).pop();
  }
}

class ContextMenuDivider extends StatelessWidget with PreferredSizeWidget {
  ContextMenuDivider();

  @override
  final preferredSize = Size.fromHeight(9);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Color(0x60969798),
      ),
    );
  }
}

class ContextMenuBackground extends StatelessWidget {
  ContextMenuBackground({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0x77B1B1B1)),
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(6),
          ),
          child: child,
        ),
      ),
    );
  }
}

Future<T?> showContextMenu<T>(
    {required BuildContext context,
    required Offset position,
    required List<PreferredSizeWidget> children,
    double width = 150}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    barrierLabel: '',
    transitionDuration: Duration(milliseconds: 0),
    transitionBuilder: (context, animation, __, child) {
      if (animation.status == AnimationStatus.forward) {
        return child;
      }

      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    pageBuilder: (context, _, __) {
      return ContextMenu(
        position: position,
        children: children,
        width: width,
      );
    },
  );
}
