import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/navigators/navigators.dart';
import 'package:project_emr/views/views.dart';
import 'package:project_emr/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class SelectBranchScreen extends StatelessWidget {
  SelectBranchScreen({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        id: 'select-branch',
        initState: (state) async {
          await controller.getAllBranches();
        },
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              appBar: CustomAppbar(
                title: 'Hi! ${controller.fullName}',
                autoImplyLeading: false,
                titleSpacing: Dimens.sixteen,
              ),
              body: Padding(
                padding: Dimens.edgeInsets16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'With which branch do you want to proceed ?',
                      style: Styles.black16,
                    ),
                    const Gap(15),
                    controller.isBranchesLoading
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade200,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5),
                              shrinkWrap: true,
                              itemCount: 6,
                              itemBuilder: (context, index) => SingleBranchItem(
                                branchName: '',
                                ontap: () {},
                              ),
                            ))
                        : controller.allBranchRes?.data == null
                            ? GestureDetector(
                                onTap: RouteManagement.goToReceptionistHome,
                                child: const Center(
                                  child: Text('No Branches Available.'),
                                ),
                              )
                            : Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5),
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.allBranchRes?.data?.length,
                                  itemBuilder: (context, index) =>
                                      SingleBranchItem(
                                    branchName:
                                        '${controller.allBranchRes?.data?[index].branchName?.capitalizeFirst}',
                                    ontap: RouteManagement.goToReceptionistHome,
                                  ),
                                ),
                              ),
                    // Expanded(
                    //   child: GridView.builder(
                    //     gridDelegate:
                    //         const SliverGridDelegateWithFixedCrossAxisCount(
                    //             crossAxisCount: 2,
                    //             mainAxisSpacing: 5,
                    //             crossAxisSpacing: 5),
                    //     shrinkWrap: true,
                    //     itemCount: controller.dummyBranchList.length,
                    //     itemBuilder: (context, index) => SingleBranchItem(
                    //       branchName: controller.dummyBranchList[index],
                    //       ontap: RouteManagement.goToReceptionistHome,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
