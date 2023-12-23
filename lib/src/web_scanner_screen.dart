// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String createdViewId = DateTime.now().microsecondsSinceEpoch.toString();
    String? barcodeNumber;

    final html.IFrameElement iframe = html.IFrameElement()
      ..src = "assets/packages/flutter_pro_barcode_scanner/assets/barcode.html"
      ..style.border = 'none'
      ..onLoad.listen((event) async {
        html.window.onMessage.listen((event) {
          if (barcodeNumber == null) {
            barcodeNumber = event.data;
            Navigator.pop(context, barcodeNumber);
          }
        });
      });
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory(createdViewId, (int viewId) => iframe);

    return Scaffold(
      body: SizedBox(
        child: HtmlElementView(
          viewType: createdViewId,
        ),
      ),
    );
  }
}
