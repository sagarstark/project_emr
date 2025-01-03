import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/data.dart';
import '../../models/models.dart';
import '../../res/res.dart';
import '../../utils/utils.dart';

/// API WRAPPER to call all the APIs and handle the status codes
class ApiWrapper {
  /// Method to make all the requests inside the app like GET, POST, PUT, Delete
  Future<ResponseModel> makeRequest(
    String api, {
    String? baseUrl,
    required RequestType type,
    required Map<String, String> headers,
    dynamic payload,
    String field = '',
    String filePath = '',
    bool showLoader = false,
    bool showDialog = true,
  }) async {
    assert(
      type != RequestType.upload ||
          (type == RequestType.upload &&
              payload is! Map<String, String> &&
              field.isNotEmpty &&
              filePath.isNotEmpty),
      'if type is passed as [RequestType.upload] then payload must be of type Map<String, String> and field & filePath must not be empty',
    );

    /// To see whether the network is available or not
    var uri = (baseUrl ?? Apis.baseUrl) + api;
    AppLog.info('[Request] - $type - $uri\n$payload');
    // if (headers['authorization'].isNullOrEmpty) {
    //   AppLog.error('Authorization error - $headers');
    //   return ResponseModel.message('Token not found', statusCode: 400);
    // }

    if (showLoader) Utility.showLoader();
    if (await Utility.isNetworkAvailable) {
      try {
        // Handles API call
        var start = DateTime.now();
        var response = await _handleRequest(
          uri,
          type: type,
          headers: headers,
          payload: payload,
          field: field,
          filePath: filePath,
        );

        // Handles response based on status code
        var res = await _processResponse(
          response,
          showDialog: showDialog,
          startTime: start,
        );
        if (showLoader) {
          Utility.closeLoader();
        }
        if (res.statusCode != 406) {
          return res;
        }
        return makeRequest(
          uri,
          baseUrl: baseUrl,
          type: type,
          headers: headers,
          payload: payload,
          field: field,
          filePath: filePath,
          showDialog: showDialog,
          showLoader: showDialog,
        );
      } on TimeoutException catch (e, st) {
        AppLog.error('TimeOutException - $e', st);
        if (showLoader) {
          Utility.closeLoader();
        }
        await Future.delayed(const Duration(milliseconds: 400));
        var res = ResponseModel.message(StringConstants.timeoutError);
        if (showDialog) {
          await Utility.showInfoDialog(res);
        }
        return res;
      } catch (e, st) {
        AppLog.error(e, st);
        if (showLoader) {
          Utility.closeLoader();
        }
        await Future.delayed(const Duration(milliseconds: 400));
        var res = ResponseModel.message(StringConstants.somethingWentWrong);

        if (showDialog) {
          await Utility.showInfoDialog(res);
        }
        return res;
      }
    } else {
      AppLog.error('No Internet Connection', StackTrace.current);
      if (showLoader) {
        Utility.closeLoader();
      }
      await Future.delayed(const Duration(milliseconds: 400));
      var res = ResponseModel.message(StringConstants.noInternet);

      if (showDialog) {
        await Utility.showInfoDialog(res);
      }
      return res;
    }
  }

  Future<http.Response> _handleRequest(
    String uri, {
    required RequestType type,
    required Map<String, String> headers,
    required String field,
    required String filePath,
    dynamic payload,
  }) async {
    switch (type) {
      case RequestType.get:
        return _get(uri, headers: headers);
      case RequestType.post:
        return _post(uri, payload: payload, headers: headers);
      case RequestType.put:
        return _put(uri, payload: payload, headers: headers);
      case RequestType.patch:
        return _patch(uri, payload: payload, headers: headers);
      case RequestType.delete:
        return _delete(uri, payload: payload, headers: headers);
      case RequestType.upload:
        return _upload(
          uri,
          payload: payload,
          headers: headers,
          field: field,
          filePath: filePath,
        );
    }
  }

  Future<http.Response> _get(
    String uri, {
    required Map<String, String> headers,
  }) async =>
      await http
          .get(
            Uri.parse(uri),
            headers: headers,
          )
          .timeout(AppConstants.timeOutDuration);

  Future<http.Response> _post(
    String uri, {
    required dynamic payload,
    required Map<String, String> headers,
  }) async =>
      await http
          .post(
            Uri.parse(uri),
            body: jsonEncode(payload),
            headers: headers,
          )
          .timeout(AppConstants.timeOutDuration);

  Future<http.Response> _put(
    String uri, {
    required dynamic payload,
    required Map<String, String> headers,
  }) async =>
      await http
          .put(
            Uri.parse(uri),
            body: jsonEncode(payload),
            headers: headers,
          )
          .timeout(AppConstants.timeOutDuration);

  Future<http.Response> _patch(
    String uri, {
    required dynamic payload,
    required Map<String, String> headers,
  }) async =>
      await http
          .patch(
            Uri.parse(uri),
            body: jsonEncode(payload),
            headers: headers,
          )
          .timeout(AppConstants.timeOutDuration);

  Future<http.Response> _delete(
    String uri, {
    required dynamic payload,
    required Map<String, String> headers,
  }) async =>
      await http
          .delete(
            Uri.parse(uri),
            body: jsonEncode(payload),
            headers: headers,
          )
          .timeout(AppConstants.timeOutDuration);

  /// Method to make all the requests inside the app like GET, POST, PUT, Delete
  Future<http.Response> _upload(
    String uri, {
    required Map<String, String> payload,
    required Map<String, String> headers,
    required String field,
    required String filePath,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(uri),
    )
      ..headers.addAll(headers)
      ..fields.addAll(payload)
      ..files.add(
        await http.MultipartFile.fromPath(field, filePath),
      );

    var response = await request.send();

    return await http.Response.fromStream(response);
  }

  /// Method to return the API response based upon the status code of the server
  Future<ResponseModel> _processResponse(
    http.Response response, {
    required bool showDialog,
    required DateTime startTime,
  }) async {
    var diff = DateTime.now().difference(startTime).inMilliseconds / 1000;
    AppLog(
        '[Response] - $diff s Status code - ${response.statusCode} ${response.request?.url}\n${response.body}');

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 208:
        return ResponseModel(
          data: utf8.decode(response.bodyBytes),
          hasError: false,
          statusCode: response.statusCode,
        );
      case 400:
      case 401:
      case 404:
      case 406:
      case 409:
      case 410:
      case 412:
      case 413:
      case 415:
      case 416:
      case 522:
        if (response.statusCode == 401) {
          // UnAuthorized
          // Logic to clear the data and send user to login view
          // ex: Get.find<ProfileController>().clearData();
          //     RouteManagement.goToSignIn();
        } else if (response.statusCode == 406) {
          // Token expired
          // Logic to refresh the token the API will be called again automatically from the makeRequest function
          // ex: await Get.find<AuthController>().refreshToken();
        }
        var res = ResponseModel(
          data: utf8.decode(response.bodyBytes),
          hasError: true,
          statusCode: response.statusCode,
        );
        if (![401, 404, 406, 410].contains(response.statusCode) && showDialog) {
          await Utility.showInfoDialog(res);
        }
        return res;
      case 500:
        var res = ResponseModel(
          data: utf8.decode(response.bodyBytes),
          hasError: true,
          statusCode: response.statusCode,
        );
        if (showDialog) {
          await Utility.showInfoDialog(res);
        }
        return res;

      default:
        return ResponseModel(
          data: utf8.decode(response.bodyBytes),
          hasError: true,
          statusCode: response.statusCode,
        );
    }
  }
}
