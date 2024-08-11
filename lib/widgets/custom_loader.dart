import 'package:flutter/material.dart';
import 'package:project_emr/res/res.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: ColorsValue.primaryColor,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white60,
          ),
        ),
      );
}
