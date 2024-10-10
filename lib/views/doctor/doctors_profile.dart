import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
                        const AssetImage(AssetConstants.doctorProfilePic),
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
                  const Gap(10),
                  RatingBar(
                    initialRating: 4,
                    itemSize: Dimens.twentyFive,
                    ignoreGestures: true,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    unratedColor: Colors.grey,
                    ratingWidget: RatingWidget(
                      full: SvgPicture.asset(
                        AssetConstants.fullRatingStar,
                        colorFilter: const ColorFilter.mode(
                            Colors.orange, BlendMode.srcIn),
                      ),
                      half: SvgPicture.asset(
                        AssetConstants.halfRatingStar,
                        colorFilter: const ColorFilter.mode(
                            Colors.orange, BlendMode.srcIn),
                      ),
                      empty: SvgPicture.asset(
                        AssetConstants.emptyRatingStar,
                        colorFilter: const ColorFilter.mode(
                            Colors.orange, BlendMode.srcIn),
                      ),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {},
                  ),
                  const Gap(40),
                  Text(
                    'Book an appointment via',
                    style: Styles.black14w500,
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          heroTag: 'Chat',
                          elevation: 0,
                          backgroundColor: Colors.green.shade100,
                          label: Text(
                            'Chat',
                            style: Styles.black14w500,
                          ),
                          icon: const Icon(Icons.message_rounded),
                        ),
                      ),
                      Text(
                        '  OR  ',
                        style: Styles.black14w500,
                      ),
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
                  const Gap(20),
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
                  ),
                  const Gap(20),
                  SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Specilisation',
                          style: Styles.blackBold16,
                        ),
                        const Gap(10),
                        Text(
                          'Haematolgy, General Medicine',
                          style: Styles.black14,
                        ),
                        const Gap(20),
                        Text(
                          'Qualification',
                          style: Styles.blackBold16,
                        ),
                        const Gap(10),
                        Text(
                          'Physician, Internal Medicine\nFrom : Concord Regional Medical Center, Concord, CA',
                          style: Styles.black14,
                        ),
                      ],
                    ),
                  ),
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
