import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';

class TodayOrderList extends StatelessWidget {
  const TodayOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimens.fifteen),
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Gap(10),
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(Dimens.ten),
            onTap: RouteManagement.goToPharmacyOrderDetails,
            child: Card(
              surfaceTintColor: ColorsValue.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Dimens.ten,
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: Dimens.twenty,
                      child: const Icon(Icons.person),
                    ),
                    title: Text(
                      'Name : Tony Stark',
                      style: Styles.black14w500,
                    ),
                    subtitle: Text(
                      'Order ID : 1234567890',
                      style: Styles.grey12w500,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: Dimens.fifteen,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.all(Dimens.ten),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ordered On : 12 Aug 2024, 12:00 AM',
                          style: Styles.black12,
                        ),
                        Gap(10),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment',
                                  style: Styles.grey12w500,
                                ),
                                Text(
                                  '₹310.00',
                                  style: Styles.black12w500.copyWith(
                                    color: ColorsValue.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Status',
                                  style: Styles.grey12w500,
                                ),
                                Text(
                                  'Pending',
                                  style: Styles.black12w500.copyWith(
                                    color: ColorsValue.purpleColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
