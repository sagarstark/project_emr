import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/res/theme/theme.dart';
import 'package:project_emr/widgets/widgets.dart';

class OrderMedicineView extends StatelessWidget {
  OrderMedicineView({super.key});

  List<DropDownValueModel> numberList = List.generate(
    100,
    (index) => DropDownValueModel(
      name: (index + 1).toString(),
      value: (index + 1).toString(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Order Your Medicines',
      ),
      body: Padding(
        padding: Dimens.edgeInsets16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search for your Medicine here',
              style: Styles.black14,
            ),
            const Gap(10),
            CustomTextfield(
              hintText: 'Search Here',
              onChange: (value) {},
            ),
            const Gap(10),
            Text(
              'Select your Order type',
              style: Styles.black14,
            ),
            const Gap(10),
            const CustomDropdownField(
              hintText: 'Order Type',
              dropDownList: [
                DropDownValueModel(name: 'Regular', value: '1'),
                DropDownValueModel(name: 'STAT', value: '1'),
                DropDownValueModel(name: 'PRN', value: '1'),
                DropDownValueModel(name: 'Bolus', value: '1'),
                DropDownValueModel(name: 'Continuous Infusion', value: '1'),
                DropDownValueModel(name: 'IV Push', value: '1'),
                DropDownValueModel(name: 'Oral', value: '1'),
                DropDownValueModel(name: 'Vaginal', value: '1'),
                DropDownValueModel(name: 'Rectal', value: '1'),
                DropDownValueModel(name: 'Parentral(IV,IM,SC)', value: '1'),
                DropDownValueModel(name: 'ENT', value: '1'),
                DropDownValueModel(name: 'Drops', value: '1'),
                DropDownValueModel(name: 'Nasal Spray', value: '1'),
                DropDownValueModel(name: 'Inhalers Oral And Nasal', value: '1'),
                DropDownValueModel(name: 'Staggered Orders', value: '1'),
              ],
            ),
            const Gap(15),
            Text(
              'Select your Dosage and Quantity',
              style: Styles.black14,
            ),
            const Gap(10),
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: CustomDropdownField(
                    hintText: 'Dosage',
                    dropDownList: [
                      DropDownValueModel(name: 'ml', value: '1'),
                      DropDownValueModel(name: 'mcg', value: '1'),
                      DropDownValueModel(name: 'mg', value: '1'),
                      DropDownValueModel(name: 'Tablet', value: '1'),
                      DropDownValueModel(name: 'Capsule', value: '1'),
                      DropDownValueModel(name: 'Vial', value: '1'),
                      DropDownValueModel(name: 'Bottle', value: '1'),
                      DropDownValueModel(name: 'IU', value: '1'),
                      DropDownValueModel(name: 'cc', value: '1'),
                      DropDownValueModel(name: 'Mol', value: '1'),
                      DropDownValueModel(name: 'Mmol', value: '1'),
                      DropDownValueModel(name: 'Puff', value: '1'),
                      DropDownValueModel(name: 'Drops', value: '1'),
                      DropDownValueModel(name: 'Sachet', value: '1'),
                      DropDownValueModel(name: 'Ampule', value: '1'),
                      DropDownValueModel(name: 'Suppository', value: '1'),
                      DropDownValueModel(name: 'patch', value: '1'),
                      DropDownValueModel(name: 'Gram', value: '1'),
                    ],
                  ),
                ),
                const Gap(15),
                Expanded(
                  flex: 2,
                  child: CustomDropdownField(
                    hintText: 'Qty',
                    dropDownList: numberList,
                  ),
                ),
              ],
            ),
            Gap(15),
            Card(
              elevation: 5,
              margin: Dimens.edgeInsets0,
              child: Padding(
                padding: Dimens.edgeInsets10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sl No.1',
                          style: Styles.blackBold14,
                        ),
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    Gap(10),
                    Expanded(
                      child: SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Trade Name :\nREMEDESIVIR 100MG',
                              style: Styles.blackBold14,
                            ),
                            Gap(10),
                            Text(
                              'Ingredient Name : REMEDIGEN 100[REMEDESIVIR 100]',
                              style: Styles.black14w500,
                            ),
                            Gap(10),
                            Text(
                              'Status/Type : Active',
                              style: Styles.black14w500,
                            ),
                            Gap(10),
                            Text(
                              'Drug Form/Order Type :\nInjection Regular',
                              style: Styles.black14w500,
                            ),
                            Gap(10),
                            Text(
                              'Frequency : 1',
                              style: Styles.black14w500,
                            ),
                            Gap(10),
                            Text(
                              'ROA : DEEP SC',
                              style: Styles.black14w500,
                            ),
                            Gap(10),
                            Text(
                              'Duration : 2',
                              style: Styles.black14w500,
                            ),
                            Gap(15),
                            Text(
                              'Remarks',
                              style: Styles.blackBold14,
                            ),
                            Text(
                              'Take 1 Tablet,0-0-1 Time(s) per Day for 2 Day(s)',
                              style: Styles.black14w500,
                            ),
                          ],
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert), // 3-dot icon
                      onSelected: (String value) {
                        // Handle the selected option here
                        print(value);
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: 'edit',
                            child: Text(
                              'Edit Medicine',
                              style: Styles.black12w500
                                  .copyWith(color: Colors.amber.shade900),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Text(
                              'Delete Medicine',
                              style: Styles.black12w500
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'Move',
                            child: Text(
                              'Submit to CNM eRX',
                              style: Styles.black12w500
                                  .copyWith(color: Colors.green),
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
