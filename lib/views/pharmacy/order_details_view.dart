import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/widgets/widgets.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Order Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dimens.edgeInsets16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                margin: EdgeInsets.zero,
                surfaceTintColor: ColorsValue.primaryColor,
                child: Padding(
                  padding: Dimens.edgeInsets10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Medicine Details',
                        style: Styles.blackBold14,
                      ),
                      const Gap(15),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => SingleOrderItem(
                            serialNumber: '${index + 1}',
                            name: 'Dolo 650 MG',
                            productId: '1234567890',
                            type: 'Tablet',
                            quantity: '10',
                            pricePerUnit: '₹30.00',
                            totalPrice: '₹300.00'),
                        separatorBuilder: (context, index) => Divider(
                          height: Dimens.thirty,
                          color: Colors.black,
                        ),
                        itemCount: 5,
                      ),
                      Divider(
                        thickness: 2,
                        color: ColorsValue.primaryColor,
                        height: Dimens.thirty,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Grand Total',
                            style: Styles.blackBold14,
                          ),
                          Text(
                            '₹3000.00',
                            style: Styles.blackBold14
                                .copyWith(color: ColorsValue.primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(15),
              Card(
                elevation: 5,
                margin: EdgeInsets.zero,
                surfaceTintColor: ColorsValue.primaryColor,
                child: Padding(
                  padding: Dimens.edgeInsets10,
                  child: SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Details',
                          style: Styles.blackBold14,
                        ),
                        const Gap(15),
                        Text(
                          'Name : Tony Stark',
                          style: Styles.black14w500,
                        ),
                        Text(
                          'Plot No - 649, POLO Pvt Ltd\nGround Floor\nUdyog Nagar\nGurugram\nHaryana\nPin-122016',
                          style: Styles.black14,
                        ),
                        Text(
                          'Phone Number : 7381748199',
                          style: Styles.black14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleOrderItem extends StatelessWidget {
  const SingleOrderItem({
    super.key,
    required this.serialNumber,
    required this.name,
    required this.productId,
    required this.type,
    required this.quantity,
    required this.pricePerUnit,
    required this.totalPrice,
  });

  final String serialNumber;
  final String name;
  final String productId;
  final String type;
  final String quantity;
  final String pricePerUnit;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sl. No.\n$serialNumber',
              style: Styles.black14w500,
              textAlign: TextAlign.center,
            ),
            const Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : $name',
                  style: Styles.black14w500,
                ),
                Text(
                  'Product Id : $productId',
                  style: Styles.grey14w500,
                ),
                Text(
                  'Type : $type',
                  style: Styles.grey14w500,
                ),
              ],
            ),
          ],
        ),
        const Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Qty',
                  style: Styles.black14w500,
                ),
                Text(
                  quantity,
                  style: Styles.black14w500
                      .copyWith(color: ColorsValue.primaryColor),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price per unit',
                  style: Styles.black14w500,
                ),
                Text(
                  pricePerUnit,
                  style: Styles.black14w500
                      .copyWith(color: ColorsValue.primaryColor),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: Styles.black14w500,
                ),
                Text(
                  totalPrice,
                  style: Styles.black14w500
                      .copyWith(color: ColorsValue.primaryColor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
