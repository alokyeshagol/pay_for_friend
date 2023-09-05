import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:pay_for_friend/screen/success.dart';

const bgColor = Color(0xfffafafa);

class QRCodeScanner extends StatefulWidget {
  QRCodeScanner({super.key, required this.giverName});
  final String giverName;

  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isLoading = true;

  QRViewController? controller;
  String scannedCode = '';

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedCode = scanData.code!;
      });
    });
  }

  void _onRequestPayment(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => TransactionSuccess(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 18, 50, 163),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "iGotchu",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Place QR Code in the Area",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Scanning will be done automatically",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      QRView(
                        key: qrKey,
                        onQRViewCreated: _onQRViewCreated,
                      ),
                      QRScannerOverlay(
                        overlayColor: bgColor,
                      )
                    ],
                  )),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.payments_rounded),
                      style: const ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 18, 50, 163),
                        ),
                      ),
                      onPressed: () {
                        _onRequestPayment(context);
                      },
                      label: Text("Request " +
                          widget.giverName +
                          " to Pay $scannedCode "),
                    )),
              ),
            ],
          ),
        ));
  }
}
