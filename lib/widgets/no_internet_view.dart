// import 'package:flutter/material.dart';
// import 'package:ft_members_app/res/res.dart';
// import 'package:ft_members_app/utils/translations/translation_keys.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// /// class NoInternetView for showing no internet screen
// class NoInternetView extends StatelessWidget {
//   const NoInternetView({super.key});

//   @override
//   Widget build(BuildContext context) => PopScope(
//         canPop: false,
//         child: Material(
//           color: ColorsValue.whiteColor,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Lottie.asset(
//                 AssetConstants.noInternetLottie,
//                 height: Dimens.hundredFifty,
//                 width: Dimens.hundredFifty,
//                 fit: BoxFit.cover,
//               ),
//               Dimens.boxHeight10,
//               Padding(
//                 padding: Dimens.edgeInsets16_0_16_0,
//                 child: Text(
//                   TranslationKeys.noInternetMsg.tr,
//                   textAlign: TextAlign.center,
//                   style: Styles.redBold14,
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
// }
