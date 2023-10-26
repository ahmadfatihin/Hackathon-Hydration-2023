import 'package:flutter/material.dart';

import 'dart:math' as math;

import '../../themes/pallets.dart';
import 'custom_logo.dart';

class CustomLoadingAnimation extends StatefulWidget {
  const CustomLoadingAnimation({
    Key? key,
    this.color,
    this.ringColor,
    this.size,
  }) : super(key: key);

  final Color? color;
  final Color? ringColor;
  final double? size;

  @override
  State<CustomLoadingAnimation> createState() => _CustomLoadingAnimationState();
}

class _CustomLoadingAnimationState extends State<CustomLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = widget.color ?? Pallet.success;
    final Color ringColor = widget.ringColor ?? Pallet.successBg;
    final double size = widget.size ?? 200;
    final double strokeWidth = size / 16;

    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) {
              return Stack(
                children: <Widget>[
                  Transform.rotate(
                    angle: Tween<double>(begin: 0, end: 2 * math.pi)
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: const Interval(
                              0.68,
                              0.95,
                              curve: Curves.easeOut,
                            ),
                          ),
                        )
                        .value,
                    child: Visibility(
                      visible: _animationController.value >= 0.5,
                      child: Arc.draw(
                        color: ringColor,
                        size: size,
                        strokeWidth: strokeWidth,
                        startAngle: -math.pi / 2,
                        endAngle: Tween<double>(
                          begin: math.pi / 2,
                          end: math.pi / (size * size),
                        )
                            .animate(
                              CurvedAnimation(
                                parent: _animationController,
                                curve: const Interval(
                                  0.7,
                                  0.95,
                                  curve: Curves.easeOutSine,
                                ),
                              ),
                            )
                            .value,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _animationController.value >= 0.5,
                    child: Arc.draw(
                      color: ringColor,
                      size: size,
                      strokeWidth: strokeWidth,
                      startAngle: -math.pi / 2,
                      endAngle: Tween<double>(
                        begin: -2 * math.pi,
                        end: math.pi / (size * size),
                      )
                          .animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: const Interval(
                                0.6,
                                0.95,
                                curve: Curves.easeOutSine,
                              ),
                            ),
                          )
                          .value,
                    ),
                  ),
                  Visibility(
                    visible: _animationController.value <= 0.5,
                    child: Transform.rotate(
                      angle: Tween<double>(begin: 0, end: math.pi * 0.06)
                          .animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: const Interval(
                                0.48,
                                0.5,
                              ),
                            ),
                          )
                          .value,
                      child: Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: strokeWidth,
                        startAngle: -math.pi / 2,
                        endAngle: Tween<double>(
                                begin: math.pi / (size * size),
                                end: 1.94 * math.pi)
                            .animate(
                              CurvedAnimation(
                                parent: _animationController,
                                curve: const Interval(
                                  0.05,
                                  0.48,
                                  curve: Curves.easeOutSine,
                                ),
                              ),
                            )
                            .value,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _animationController.value >= 0.5,
                    child: Arc.draw(
                      color: color,
                      size: size,
                      strokeWidth: strokeWidth,
                      startAngle: -math.pi / 2,
                      endAngle: Tween<double>(
                        begin: -1.94 * math.pi,
                        end: math.pi / (size * size),
                      )
                          .animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: const Interval(
                                0.5,
                                0.95,
                                curve: Curves.easeOutSine,
                              ),
                            ),
                          )
                          .value,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const Center(
          child: CustomLogo(
            height: 125,
            width: 125,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class Arc extends CustomPainter {
  final Color _color;
  final double _strokeWidth;
  final double _sweepAngle;
  final double _startAngle;

  Arc._(
    this._color,
    this._strokeWidth,
    this._startAngle,
    this._sweepAngle,
  );

  static Widget draw({
    required Color color,
    required double size,
    required double strokeWidth,
    required double startAngle,
    required double endAngle,
  }) =>
      SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: Arc._(
            color,
            strokeWidth,
            startAngle,
            endAngle,
          ),
        ),
      );

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.height / 2,
    );

    const bool useCenter = false;
    final Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _strokeWidth;

    canvas.drawArc(rect, _startAngle, _sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
