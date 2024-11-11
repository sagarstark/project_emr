import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/widgets/widgets.dart';

class DoctorsProfile extends StatelessWidget {
  const DoctorsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: Dimens.edgeInsets16,
        child: CustomButton(
          title: 'Book an Appointment',
          onTap: () {},
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: Get.height / 3,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.twenty),
                child: Image.asset(
                  AssetConstants.doctorProfilePic,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: Dimens.edgeInsets16,
              child: Column(
                children: [
                  Text(
                    "Dr. Suresh Joshi",
                    style: Styles.blackBold20,
                  ),
                  Gap(10),
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
                          'Specialisation',
                          style: Styles.blackBold16,
                        ),
                        const Gap(10),
                        Text(
                          'Haematology, General Medicine',
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
