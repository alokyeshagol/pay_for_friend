// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_for_friend/data/dummy_people.dart';

class PendingRequestDetial extends StatelessWidget {
  final dynamic requestDetails;
  const PendingRequestDetial({super.key, required this.requestDetails});

  final bool isLoading = false;

  Future<void> sleep(Duration duration) {
    return Future.delayed(duration, () => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          requestDetails["name"],
          style: const TextStyle(fontSize: 15),
        ),
        backgroundColor: const Color.fromARGB(255, 18, 50, 163),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator.adaptive())
          : Center(
              child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: SvgPicture.asset(
                    'assets/images/takealot.svg',
                    width: 50, // Set the width
                    height: 50, // Set the height
                  ),
                  // child: Text(
                  //   "TakeALot",
                  //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  // ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Requested Date ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: generateRandomDateTimeString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      foregroundDecoration:
                          BoxDecoration(shape: BoxShape.rectangle),
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey[200], shape: BoxShape.rectangle),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Requestors Name: "),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(requestDetails["name"] +
                                    " " +
                                    requestDetails["surname"])
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Amount: "),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("R 1630.98")
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Items: "),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("3")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        // Handle the "Request" button press
                        SnackBar snackBar = SnackBar(
                          content: Text("Request Rejected"),
                          duration: Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.redAccent,
                          margin: EdgeInsets.only(bottom: 20.0),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.redAccent, // Button text color
                        side: BorderSide(
                            color: Colors.redAccent), // Outline color
                      ),
                      child: Text('Reject'),
                    ),
                    SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {
                        // Handle the "Approve" button press
                        SnackBar snackBar = SnackBar(
                          content: Text("Request Approved"),
                          duration: Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green[400],
                          margin: EdgeInsets.only(bottom: 20.0),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color.fromARGB(
                            255, 18, 50, 163), // Button text color
                        side: BorderSide(
                          color: Color.fromARGB(255, 18, 50, 163),
                        ), // Outline color
                      ),
                      child: Text('Approve'),
                    ),
                  ],
                ),
              ],
            )),
    );
  }
}
