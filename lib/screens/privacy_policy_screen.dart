import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;

class PrivacyPolicyScreen extends StatelessWidget {
  final String url;

  const PrivacyPolicyScreen(
      {super.key,
      this.url = 'https://www.adriaticfurniture.hr/privacy-policy/'});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      body: kIsWeb
          ? _buildWebViewWeb()
          : WebViewWidget(controller: homeController.controller),
    );
  }

  Widget _buildWebViewWeb() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'webviewElement',
      (int viewId) {
        final iframe = html.IFrameElement()
          ..src = url
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%';
        return iframe;
      },
    );

    return const HtmlElementView(viewType: 'webviewElement');
  }
}
