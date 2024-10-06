import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';

class DoctorsProfile extends StatelessWidget {
  const DoctorsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundColor: ColorsValue.secondaryColor,
                    radius: Dimens.eighty,
                    foregroundImage:
                        AssetImage(AssetConstants.doctorProfilePic),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: Dimens.edgeInsets16,
              child: Column(
                children: [
                  Text(
                    "Suresh Joshi",
                    style: Styles.blackBold20,
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          heroTag: 'Message',
                          elevation: 0,
                          backgroundColor: Colors.green.shade100,
                          label: Text(
                            'Message',
                            style: Styles.black14w500,
                          ),
                          icon: const Icon(Icons.message_rounded),
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          heroTag: 'Call',
                          elevation: 0,
                          backgroundColor: Colors.blue.shade100,
                          label: Text(
                            'Call',
                            style: Styles.black14w500,
                          ),
                          icon: const Icon(Icons.call_rounded),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  const SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileInfoItem(title: 'Age', value: '35'),
                        VerticalDivider(),
                        ProfileInfoItem(title: 'Gender', value: 'Male'),
                        VerticalDivider(),
                        ProfileInfoItem(title: 'Experience', value: '7 Yrs'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: Dimens.edgeInsets8,
            child: Text(
              value,
              style: Styles.blackBold16,
            ),
          ),
          Text(
            title,
            style: Styles.black12,
          )
        ],
      ),
    );
  }
}
