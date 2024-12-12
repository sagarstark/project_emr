import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class OrderLabTestView extends StatelessWidget {
  const OrderLabTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppbar(
            title: 'Order Lab Test',
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(Dimens.sixteen),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'Close',
                    buttonType: ButtonType.cancelled,
                    onTap: () => Get.back(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    title: 'Add',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextfield(
                  textEditingController: controller.labTestSearchController,
                  hintText: 'Search Procedure',
                  prefixIcon: const Icon(Icons.search),
                  onChange: (value) {},
                ),
                const Gap(16),
                CustomTextfield(
                  textEditingController: controller.labTestNameController,
                  hintText: 'Lab Test',
                  onChange: (value) {},
                ),
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextfield(
                        textEditingController:
                            controller.labTestNormalRateController,
                        hintText: 'Normal Rate',
                        textInputType: TextInputType.number,
                        onChange: (value) {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextfield(
                        textEditingController:
                            controller.labTestQuantityController,
                        hintText: 'Quantity',
                        textInputType: TextInputType.number,
                        onChange: (value) {},
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextfield(
                        textEditingController:
                            controller.labTestPriceController,
                        hintText: 'Price',
                        textInputType: TextInputType.number,
                        onChange: (value) {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextfield(
                        textEditingController:
                            controller.labTestDiscountController,
                        hintText: 'Discount',
                        textInputType: TextInputType.number,
                        onChange: (value) {},
                      ),
                    ),
                  ],
                ),
                const Gap(16),

                // Service Provider Dropdown
                Obx(() => CustomDropdownField(
                      dropDownList: controller.serviceProviders.map((provider) {
                        return DropDownValueModel(
                          name: provider,
                          value: provider,
                        );
                      }).toList(),
                      hintText: 'Dosage',
                      onChanged: (value) {},
                    )),
                const Gap(16),
                Obx(() => CustomDropdownField(
                      dropDownList: controller.serviceProviders.map((provider) {
                        return DropDownValueModel(
                          name: provider,
                          value: provider,
                        );
                      }).toList(),
                      hintText: 'Pre App',
                      onChanged: (value) {},
                    )),

                const Gap(16),
                CustomTextfield(
                  textEditingController:
                      controller.labTestCoInsuranceController,
                  hintText: 'Co-Insurance',
                  onChange: (value) {},
                ),
                const Gap(16),
                CustomTextfield(
                  textEditingController: controller.labTestServiceByController,
                  hintText: 'Service By',
                  onChange: (value) {},
                ),
                const Gap(16),
                CustomTextfield(
                  textEditingController:
                      controller.labTestServiceDateController,
                  hintText: 'Service Date and Time',
                  onChange: (value) {},
                ),
                const Gap(16),
                Obx(
                  () => Row(
                    children: [
                      const Text('Covered'),
                      const Gap(16),
                      Expanded(
                        child: RadioListTile<bool>(
                          title: const Text('No'),
                          value: false,
                          groupValue: controller.isCovered.value,
                          onChanged: (value) =>
                              controller.isCovered.value = value!,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<bool>(
                          title: const Text('Yes'),
                          value: true,
                          groupValue: controller.isCovered.value,
                          onChanged: (value) =>
                              controller.isCovered.value = value!,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                CustomTextfield(
                  textEditingController: controller.labTestRemarksController,
                  hintText: 'Remarks',
                  maxlines: 3,
                  onChange: (value) {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
