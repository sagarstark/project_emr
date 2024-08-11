// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:ft_members_app/utils/utils.dart';

// class DeviceType {
//   DeviceType(this._context) {
//     init();
//   }
//   // static DeviceType? _instance;
//   final BuildContext _context;
//   DeviceScreenType _deviceType = DeviceScreenType.mobile;

//   void init() {
//     final deviceWidth = MediaQuery.of(_context).size.width;

//     if (kIsWeb) {
//       // For web, you can use the screen size to determine the device type
//       if (deviceWidth < 600) {
//         _deviceType = DeviceScreenType.mobile;
//       } else if (deviceWidth >= 600 && deviceWidth < 1024) {
//         _deviceType = DeviceScreenType.tablet;
//       } else {
//         _deviceType = DeviceScreenType.web;
//       }
//     } else {
//       // For non-web platforms (iOS, Android), you can use the device's OS to determine the device type
//       // if (Theme.of(_context).platform == TargetPlatform.iOS ||
//       //     Theme.of(_context).platform == TargetPlatform.android) {
//       //   _deviceType = DeviceScreenType.mobile;
//       // } else {
//       //   _deviceType = DeviceScreenType.tablet;
//       // }
//       if (deviceWidth < 600) {
//         _deviceType = DeviceScreenType.mobile;
//       } else if (deviceWidth >= 600 && deviceWidth < 1200) {
//         _deviceType = DeviceScreenType.tablet;
//       } else {
//         _deviceType = DeviceScreenType.web;
//       }
//     }
//   }

//   DeviceScreenType get deviceType => _deviceType;
// }
