import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatefulWidget {
  const CustomWebView({
    super.key,
    required this.url,
    required this.appBarTitle,
  });

  final String url;
  final String appBarTitle;

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  late WebViewController controller;
  var loadingPercentage = 0;

  var webUrl = '';

  @override
  void initState() {
    super.initState();
    webUrl = widget.url;
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          if (mounted) {
            setState(() {
              loadingPercentage = 0;
            });
          }
        },
        onProgress: (progress) {
          if (mounted) {
            setState(() {
              loadingPercentage = progress;
            });
          }
        },
        onPageFinished: (url) {
          if (mounted) {
            setState(() {
              loadingPercentage = 100;
            });
          }
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(webUrl),
      )
      ..enableZoom(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: GetPlatform.isAndroid ? true : false,
      appBar: CustomAppbar(
        title: widget.appBarTitle,
      ),
      bottomNavigationBar: BottomAppBar(
        height: GetPlatform.isAndroid ? Dimens.sixty : Dimens.fifty,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
                onPressed: () {
                  controller.goBack();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
                onPressed: () {
                  controller.goForward();
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.replay_rounded,
                ),
                onPressed: () {
                  controller.reload();
                },
              ),
            ),
          ],
        ),
      ),
      body: loadingPercentage < 50
          ? const LinearProgressIndicator(color: ColorsValue.primaryColor)
          : Container(
              color: Colors.white,
              child: WebViewWidget(
                controller: controller,
              ),
            ),
    );
  }
}
