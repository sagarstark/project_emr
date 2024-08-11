import 'package:flutter/material.dart';
import 'package:project_emr/widgets/widgets.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: 'Order Details',
      ),
    );
  }
}
