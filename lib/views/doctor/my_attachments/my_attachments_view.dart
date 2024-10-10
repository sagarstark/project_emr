import 'package:flutter/material.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/views/doctor/my_attachments/billing_record.dart';
import 'package:project_emr/views/doctor/my_attachments/clinical_record.dart';
import 'package:project_emr/views/doctor/my_attachments/medical_record.dart';
import 'package:project_emr/widgets/widgets.dart';

class MyAttachmentsView extends StatelessWidget {
  const MyAttachmentsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppbar(
          title: 'Attachments',
        ),
        body: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Padding(
            padding: Dimens.edgeInsets16_10_16_16,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50)),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    overlayColor: WidgetStateColor.transparent,
                    labelColor: Colors.white,
                    labelStyle:
                        Styles.white14w500.copyWith(fontFamily: 'Poppins'),
                    indicator: BoxDecoration(
                      color: ColorsValue.primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.fifty),
                      ),
                    ),
                    tabs: const [
                      Tab(text: 'Clinical'),
                      Tab(text: 'Medical'),
                      Tab(text: 'Billing'),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      ClinicalRecord(),
                      MedicalRecord(),
                      BillingRecord(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
