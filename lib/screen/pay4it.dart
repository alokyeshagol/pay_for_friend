//this is landing page for pay4it
//you will be able to navigate from here and do multiple operations like
//   1. add new beneficiary,
//   2. set limits,
//   3. select beneficairy whom you want to send the payment request.

import 'package:flutter/material.dart';
import 'package:pay_for_friend/screen/request_pay_screen.dart';
import 'package:pay_for_friend/screen/manage_beneficiary.dart';

const String semanticLabel = "Request Pay";

class Pay4ITScreen extends StatelessWidget {
  const Pay4ITScreen({super.key});

  //below code excutes when the user clicks on the Pay4IT list item
  void _onRequestPay(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const RequestPay(),
      ),
    );
  }

  void _onManageBeneficiary(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ManageBeneficiary(),
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
          const SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 30,
              ),
              IconButton(
                iconSize: 80,
                onPressed: () {
                  _onRequestPay(context);
                },
                icon: const ImageIcon(
                  AssetImage("assets/images/pay.png"),
                  size: 100,
                  semanticLabel: String.fromEnvironment(semanticLabel),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                iconSize: 80,
                onPressed: () {
                  _onManageBeneficiary(context);
                },
                icon: const ImageIcon(
                  AssetImage("assets/images/icons8-automatic-100.png"),
                  size: 100,
                  semanticLabel: String.fromEnvironment(semanticLabel),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                iconSize: 80,
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage("assets/images/icons8-faq-100.png"),
                  size: 100,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const Row(
            children: <Widget>[
              SizedBox(
                width: 30,
              ),
              Text("Request Pay"),
              SizedBox(
                width: 50,
              ),
              Text("Settings"),
              SizedBox(
                width: 65,
              ),
              Text("FAQs"),
              SizedBox(
                width: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
