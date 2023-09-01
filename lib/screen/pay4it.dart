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
        backgroundColor: const Color.fromARGB(255, 18, 50, 163),
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Center(
              widthFactor: double.infinity,
              child: Image.asset(
                'assets/images/iGotchu-main3.png',
                fit: BoxFit.fill, // This makes the image fill the width
                width: double.infinity, // Set the width to fill the screen
                height: 200, // Set the desired height // Set the desired height
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
