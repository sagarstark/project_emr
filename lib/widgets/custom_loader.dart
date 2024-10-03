import 'package:flutter/material.dart';
import 'package:project_emr/res/res.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.ten),
            color: Colors.white,
          ),
          padding: Dimens.edgeInsets10,
          child: const CircularProgressIndicator.adaptive(
            backgroundColor: ColorsValue.primaryColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white60,
            ),
          ),
        ),
      );
}
