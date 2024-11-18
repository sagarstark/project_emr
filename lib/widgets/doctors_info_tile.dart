import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';

class DoctorsTile extends StatelessWidget {
  const DoctorsTile({
    super.key,
    required this.name,
    required this.experience,
    required this.onTapProfilePic,
    required this.onTap,
    required this.isSelected,
  });

  final String name;
  final String experience;
  final Function()? onTapProfilePic;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? ColorsValue.primaryColor : Colors.transparent,
            width: 2,
          ),
          color: Colors.blueAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: onTapProfilePic,
                child: const CircleAvatar(
                  backgroundColor: ColorsValue.secondaryColor,
                  radius: 50.0,
                  foregroundImage: AssetImage(AssetConstants.doctorProfilePic),
                ),
              ),
              const Gap(15),
              Expanded(
                child: SizedBox(
                  height: Dimens.eighty,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Styles.blackBold16,
                      ),
                      Text(
                        'Experience - $experience Yrs',
                        style: Styles.black14w500,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
