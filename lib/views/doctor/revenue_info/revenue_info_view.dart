import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/widgets/widgets.dart';

class RevenueInfoView extends StatelessWidget {
  const RevenueInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Revenue Info',
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(
          Dimens.twenty,
          Dimens.twenty,
          Dimens.twenty,
          Dimens.thirty,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.ten),
            topRight: Radius.circular(Dimens.ten),
          ),
          gradient: const LinearGradient(
            colors: [
              ColorsValue.primaryColor,
              ColorsValue.secondaryColor,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Grand Total',
              style: Styles.whiteBold14,
            ),
            Text(
              '\$1200',
              style: Styles.whiteBold14,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Card(
                margin: Dimens.edgeInsets16_0_16_0,
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: Dimens.edgeInsets16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name : Kevin Nash',
                        style: Styles.blackBold14,
                      ),
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Consultation',
                            style: Styles.black12w500,
                          ),
                          Text(
                            '\$300',
                            style: Styles.black12w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Prescription',
                            style: Styles.black12w500,
                          ),
                          Text(
                            '\$300',
                            style: Styles.black12w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lab',
                            style: Styles.black12w500,
                          ),
                          Text(
                            '\$300',
                            style: Styles.black12w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'X-Ray',
                            style: Styles.black12w500,
                          ),
                          Text(
                            '\$300',
                            style: Styles.black12w500,
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: Styles.blackBold12
                                .copyWith(color: Colors.blueAccent),
                          ),
                          Text(
                            '\$1200',
                            style: Styles.blackBold12
                                .copyWith(color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const Gap(10),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}
