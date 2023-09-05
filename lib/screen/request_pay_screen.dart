import 'package:flutter/material.dart';
import 'package:pay_for_friend/data/dummy_beneficiary.dart';
import 'package:pay_for_friend/screen/qr_code_scanner_screen.dart';

class RequestPay extends StatelessWidget {
  const RequestPay({super.key});

  void _onSelectedBen(BuildContext context, String giverName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => QRCodeScanner(giverName: giverName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 50, 163),
        elevation: 0,
        title: const Text("Beneficiary List"),
      ),
      body: ListView.builder(
          itemCount: availableBeneficaries.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                print("Printed the QR Scanner");
                _onSelectedBen(
                    context, availableBeneficaries[index].beneficiaryName);
              },
              child: ListTile(
                title: Text(
                  availableBeneficaries[index].beneficiaryName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                    "Limit: " + availableBeneficaries[index].limit.toString()),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color.fromARGB(255, 105, 147, 222),
                  size: 15,
                ),
              ),
            );
          }),
    );
  }
}
