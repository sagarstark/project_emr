import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class SearchDoctorsView extends StatelessWidget {
  const SearchDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Search Doctors',
      ),
      body: Padding(
        padding: Dimens.edgeInsets16,
        child: Column(
          children: [
            CustomTextfield(
              onChange: (value) {},
              hintText: 'Search with Doctors Name',
              suffixIcon: Icon(Icons.person_search_rounded),
            ),
            Gap(15),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const DoctorsTile(
                name: 'Suresh Joshi',
                experience: '5',
                onTapProfilePic: RouteManagement.goToDoctorsProfile,
                onTap: RouteManagement.goToDoctorsProfile,
                isSelected: false,
              ),
              separatorBuilder: (context, index) => Gap(10),
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}
