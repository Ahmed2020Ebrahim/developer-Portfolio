import 'package:flutter/material.dart';

class AnimatedGradientText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final List<Color> colors;
  final bool animate;
  final Duration duration;
  final Curve curve;
  final bool reverse;
  final TextAlign textAlign;

  const AnimatedGradientText({
    super.key,
    required this.text,
    required this.colors,
    this.style,
    this.animate = false,
    this.duration = const Duration(seconds: 3),
    this.curve = Curves.linear,
    this.reverse = false,
    this.textAlign = TextAlign.center,
  });

  @override
  State<AnimatedGradientText> createState() => _AnimatedGradientTextState();
}

class _AnimatedGradientTextState extends State<AnimatedGradientText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: widget.reverse);

    _curvedAnimation = CurvedAnimation(parent: _controller, curve: widget.curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors = widget.colors;

    if (widget.animate) {
      return AnimatedBuilder(
        animation: _curvedAnimation,
        builder: (_, __) {
          final offset = _curvedAnimation.value;

          final gradient = LinearGradient(
            colors: gradientColors,
            begin: Alignment(-1 + offset * 2, 0),
            end: Alignment(1 + offset * 2, 0),
          );

          return ShaderMask(
            shaderCallback: (bounds) => gradient.createShader(Offset.zero & bounds.size),
            blendMode: BlendMode.srcIn,
            child: Text(widget.text, style: widget.style),
          );
        },
      );
    } else {
      final gradient = LinearGradient(
        colors: gradientColors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );

      return ShaderMask(
        shaderCallback: (bounds) => gradient.createShader(Offset.zero & bounds.size),
        blendMode: BlendMode.srcIn,
        child: Text(widget.text, style: widget.style, textAlign: widget.textAlign),
      );
    }
  }
}
