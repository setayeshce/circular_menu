import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularMenuItem extends StatefulWidget {
  /// if icon and animatedIcon are passed, icon will be ignored
  final String? icon;
  final Color? color;
  final Color? iconColor;
  final VoidCallback onTap;
  final double iconSize;
  final double padding;
  final double margin;
  final List<BoxShadow>? boxShadow;
  final bool enableBadge;
  final double? badgeRightOffet;
  final double? badgeLeftOffet;
  final double? badgeTopOffet;
  final double? badgeBottomOffet;
  final double? badgeRadius;
  final TextStyle? badgeTextStyle;
  final String? badgeLabel;
  final Color? badgeTextColor;
  final Color? badgeColor;
  final VoidCallback? onItemTap;

  /// if animatedIcon and icon are passed, icon will be ignored
  final AnimatedBuilder? animatedIcon;

  /// creates a menu item .
  /// [onTap] must not be null.
  /// [padding] and [margin]  must be equal or greater than zero.
  CircularMenuItem({
    required this.onTap,
    this.icon,
    this.color,
    this.iconSize = 30,
    this.boxShadow,
    this.iconColor,
    this.animatedIcon,
    this.padding = 10,
    this.margin = 10,
    this.enableBadge = false,
    this.badgeBottomOffet,
    this.badgeLeftOffet,
    this.badgeRightOffet,
    this.badgeTopOffet,
    this.badgeRadius,
    this.badgeTextStyle,
    this.badgeLabel,
    this.badgeTextColor,
    this.badgeColor,
    this.onItemTap,
  })
      : assert(padding >= 0.0),
        assert(margin >= 0.0);

  @override
  State<CircularMenuItem> createState() => _CircularMenuItemState();
}

class _CircularMenuItemState extends State<CircularMenuItem> {


  @override
  Widget build(BuildContext context) {
     return InkWell(
       onTap: () {
         widget.onTap();
         widget.onItemTap?.call();
       },
      child: Container(
        width: 57.w,
        height: 57.w,
        decoration: ShapeDecoration(
          color: Colors.transparent,
          shape: OvalBorder(
            side: BorderSide(width: 1, color: Colors.cyan),
          ),
        ),
        child: ClipOval(
          child: Material(
            color: widget.color ?? Theme
                .of(context)
                .primaryColor,
            child: Padding(
              padding: EdgeInsets.all(widget.padding),
              child: widget.animatedIcon == null
                  ?
              SvgPicture.asset(
                widget.icon!,
              )
                  : widget.animatedIcon,
            ),

          ),
        ),
      ),
    );
  }
}
