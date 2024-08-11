import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';

class SingleBranchItem extends StatelessWidget {
  const SingleBranchItem({
    super.key,
    required this.branchName,
    required this.ontap,
  });

  final String branchName;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: ontap,
      child: Card(
        color: ColorsValue.secondaryColor,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetConstants.hospital,
              height: Dimens.sixty,
              width: Dimens.sixty,
            ),
            const Gap(15),
            Text(
              branchName,
              style: Styles.black16w500,
            ),
          ],
        )),
      ),
    );
  }
}
