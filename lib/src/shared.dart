export '../scanner_screen.dart'
    if (dart.library.html) 'package:flutter_pro_barcode_scanner/src/web_scanner_screen.dart'
    if (dart.library.io) 'package:flutter_pro_barcode_scanner/src/mobile_scanner_screen.dart';