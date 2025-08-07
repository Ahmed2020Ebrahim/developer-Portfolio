import 'package:flutter/material.dart';

class AnimatedGradientBorderContainer extends StatefulWidget {
  final double width;
  final double height;
  final bool isCircular;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;
  final List<Color> gradientColors;
  final Duration duration;
  final Widget? child;
  final BoxDecoration? decoration;
  final Color backgroundColor;
  final bool revers;

  const AnimatedGradientBorderContainer({
    super.key,
    this.width = 200,
    this.height = 200,
    this.isCircular = false,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.borderWidth = 2,
    this.gradientColors = const [Colors.purple, Colors.blue],
    this.duration = const Duration(seconds: 3),
    this.child,
    this.backgroundColor = Colors.transparent,
    this.decoration,
    this.revers = false,
  });

  @override
  State<AnimatedGradientBorderContainer> createState() => _AnimatedGradientBorderContainerState();
}

class _AnimatedGradientBorderContainerState extends State<AnimatedGradientBorderContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: widget.revers);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double diameter =
        widget.isCircular ? (widget.width < widget.height ? widget.width : widget.height) : 0;

    return Container(
      margin: widget.margin,
      width: widget.isCircular ? diameter : widget.width,
      height: widget.isCircular ? diameter : widget.height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _SlidingBorderPainter(
              animationValue: _controller.value,
              borderWidth: widget.borderWidth,
              colors: widget.gradientColors,
              isCircular: widget.isCircular,
              borderRadius: widget.borderRadius,
            ),
            child: ClipRRect(
              borderRadius:
                  widget.isCircular ? BorderRadius.circular(diameter) : widget.borderRadius,
              child: Container(
                margin: EdgeInsets.all(widget.borderWidth > 3 ? widget.borderWidth - 3 : 3),
                padding: widget.padding,
                decoration:
                    widget.decoration ??
                    BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius:
                          widget.isCircular ? BorderRadius.circular(diameter) : widget.borderRadius,
                    ),
                child: widget.child,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SlidingBorderPainter extends CustomPainter {
  final double animationValue;
  final double borderWidth;
  final List<Color> colors;
  final bool isCircular;
  final BorderRadiusGeometry borderRadius;

  _SlidingBorderPainter({
    required this.animationValue,
    required this.borderWidth,
    required this.colors,
    required this.isCircular,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final RRect rRect =
        isCircular
            ? RRect.fromRectXY(rect.deflate(borderWidth / 2), size.width / 2, size.height / 2)
            : RRect.fromRectAndCorners(
              rect.deflate(borderWidth / 2),
              topLeft: borderRadius.resolve(TextDirection.ltr).topLeft,
              topRight: borderRadius.resolve(TextDirection.ltr).topRight,
              bottomLeft: borderRadius.resolve(TextDirection.ltr).bottomLeft,
              bottomRight: borderRadius.resolve(TextDirection.ltr).bottomRight,
            );

    final gradient = LinearGradient(
      colors: colors,
      begin: Alignment(-1 + 2 * animationValue, -1),
      end: Alignment(1 + 2 * animationValue, 1),
      tileMode: TileMode.mirror,
    );

    final paint =
        Paint()
          ..shader = gradient.createShader(rect)
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth;

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant _SlidingBorderPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue ||
      oldDelegate.borderWidth != borderWidth ||
      oldDelegate.colors != colors ||
      oldDelegate.isCircular != isCircular ||
      oldDelegate.borderRadius != borderRadius;
}
