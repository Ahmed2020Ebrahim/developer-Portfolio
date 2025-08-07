import 'package:flutter/material.dart';

class EndedDivider extends StatelessWidget {
  const EndedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 5, child: SizedBox()),
        Expanded(flex: 2, child: Divider(color: Colors.white, thickness: 1)),
      ],
    );
  }
}
