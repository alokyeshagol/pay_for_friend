//this is landing page for pay4it
//you will be able to navigate from here and do multiple operations like
//   1. add new beneficiary,
//   2. set limits,
//   3. select beneficairy whom you want to send the payment request.

import 'package:flutter/material.dart';

class Pay4ITScreen extends StatelessWidget {
  const Pay4ITScreen({super.key});

  //below code excutes when the user clicks on the Pay4IT list item
  void _onPay4IT(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const Pay4ITScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 7, 233),
        title: const Text(
          'Pay4IT',
        ),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              child: Image.asset(
                'assets/images/dice-1.png',
                width: 12.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: const Center(
              child: Text(
                "Below the Grid will go",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
