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
          title: 'Book Now',
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
              background: Image.asset(
                AssetConstants.doctorPic,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: Dimens.edgeInsets10,
              color: ColorsValue.primaryColor,
              child: Column(
                children: [
                  Text(
                    "Dr. Shree Joshi",
                    style: Styles.whiteBold20,
                  ),
                  Text(
                    'Haematology, General Medicine',
                    style: Styles.white14w500,
                  ),
                  const Gap(10),
                  RatingBar(
                    initialRating: 4,
                    itemSize: Dimens.fifteen,
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: Dimens.edgeInsets16_0_16_0,
              child: Column(
                children: [
                  Gap(5),
                  const SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileInfoItem(title: 'Age', value: '35'),
                        VerticalDivider(),
                        ProfileInfoItem(title: 'Gender', value: 'Female'),
                        VerticalDivider(),
                        ProfileInfoItem(title: 'Experience', value: '7 Yrs'),
                      ],
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
          Text(
            value,
            style: Styles.blackBold14,
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
