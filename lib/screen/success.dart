import 'package:flutter/material.dart';

class TransactionSuccess extends StatelessWidget {
  TransactionSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 50, 163),
        elevation: 0,
        title: Text("Paid for order"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            "assets/images/Success.JPG",
            width: 500,
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "ZAR 250",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Paid Successfully"),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Checkers Order Number #8396482",
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Transaction Ref Number: 18752330508 ",
          ),
        ],
      ),
    );
  }
}
