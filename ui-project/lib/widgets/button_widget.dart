import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const _borderRadius = BorderRadius.all(Radius.circular(50));

double get _verticalPadding {
  if (kIsWeb) return 4.5;
  return Platform.isAndroid ? 5.0 : 6.0;
}

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  const ButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: _borderRadius,
      onTap: onPressed ?? () {},
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: ColoredBox(
          color: Colors.red[900]!,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 17.0,
              vertical: _verticalPadding,
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w200
              ),
            ),
          ),
        ),
      ),
    );
  }
}
