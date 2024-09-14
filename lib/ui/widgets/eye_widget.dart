import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EyeWidget extends StatelessWidget {
  const EyeWidget({super.key, required this.onTap});

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          'assets/svg/eye.svg',
          color: Colors.white,
        ),
      ),
    );
  }
}
