import 'package:flutter/material.dart';
import 'package:flutter_pro_barcode_scanner/flutter_pro_barcode_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Flutter Pro Barcode Scanner",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String scannedCode = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScannerScreen()));
              print(scannedCode);
              setState(() {
                code = scannedCode;
              });
            },
            icon: const Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                    visible: code.isNotEmpty,
                    replacement: const Text(
                      'Scan Code from App Bar',
                    ),
                    child: const Text(
                      'Scanned Code Value:',
                    )),
                if (code.isNotEmpty)
                  Text(
                    code,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
