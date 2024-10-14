import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class UploadDocumentsView extends StatelessWidget {
  const UploadDocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Upload Documents',
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: Dimens.sixteen),
        //     child: ElevatedButton(
        //       style: const ButtonStyle(
        //         backgroundColor: WidgetStatePropertyAll(
        //           ColorsValue.secondaryColor,
        //         ),
        //       ),
        //       onPressed: () {},
        //       child: Text(
        //         '+ Add New',
        //         style: Styles.black12,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      bottomNavigationBar: Padding(
        padding: Dimens.edgeInsets16,
        child: Row(
          children: [
            const Expanded(
              child: CustomButton(
                title: 'Save',
                isDisable: false,
                onTap: RouteManagement.goToPatientHome,
              ),
            ),
            const Gap(10),
            Expanded(
              child: CustomButton(
                title: 'Cancel',
                isDisable: false,
                buttonType: ButtonType.cancelled,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: Dimens.edgeInsets16,
        child: Column(
          children: [
            CustomDropdownField(
              onChanged: (p0) {},
              hintText: 'Type of Document',
              dropDownList: [
                DropDownValueModel(name: 'Aadhar Card', value: '1'),
                DropDownValueModel(name: 'PAN Card', value: '1'),
                DropDownValueModel(name: 'Passport', value: '1'),
              ],
            ),
            const Gap(10),
            CustomTextfield(
              onChange: (value) {},
              hintText: 'If other, mention the type type',
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: CustomTextfield(
                    onChange: (value) {},
                    hintText: 'Attachments',
                  ),
                ),
                const Gap(10),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      ColorsValue.secondaryColor,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Upload',
                    style: Styles.black12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
