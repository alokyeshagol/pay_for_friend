// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_for_friend/data/dummy_people.dart';

class PendingRequestDetail extends StatefulWidget {
  final dynamic requestDetails;
  final int index;

  const PendingRequestDetail(
      {Key? key, required this.requestDetails, required this.index})
      : super(key: key);

  @override
  _PendingRequestDetailState createState() => _PendingRequestDetailState();
}

class _PendingRequestDetailState extends State<PendingRequestDetail> {
  bool isLoading = false;
  bool isButtonEnabled = true;
  bool isRejected = false;

  @override
  void initState() {
    super.initState();
    // You can perform any initialization here
  }

  Future<void> sleep(Duration duration) {
    return Future.delayed(duration, () => {});
  }

  void successMock() async {
    await sleep(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
      isButtonEnabled = false;
    });

    SnackBar snackBar = SnackBar(
      content: Text("Request Approved"),
      duration: Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green[400],
      margin: EdgeInsets.only(bottom: 20.0),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.requestDetails["name"],
          style: const TextStyle(fontSize: 15),
        ),
        backgroundColor: const Color.fromARGB(255, 18, 50, 163),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: widget.index == 1
                        ? Image.asset('assets/images/checkers60.png')
                        : widget.index == 2
                            ? Image.asset('assets/images/one-day-only.png')
                            : SvgPicture.asset(
                                'assets/images/takealot.svg',
                                width: 50,
                                height: 50,
                              ),
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
                            fontWeight: FontWeight.w500,
                          ),
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
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey[200], shape: BoxShape.rectangle),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Requestor's Name: "),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(widget.requestDetails["name"] +
                                      " " +
                                      widget.requestDetails["surname"]),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Amount: "),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("R 1630.98"),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Items: "),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("3"),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Status: "),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  isRejected
                                      ? Text(
                                          "Rejected",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : !isButtonEnabled
                                          ? Text(
                                              "Approved",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )
                                          : Text(
                                              "Pending",
                                              style: TextStyle(
                                                  color: Colors.blueGrey),
                                            ),
                                ],
                              )
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
                          if (!isButtonEnabled) {
                            return null;
                          }
                          setState(() {
                            isRejected = true;
                            isButtonEnabled = false;
                          });
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
                          foregroundColor:
                              isButtonEnabled ? Colors.redAccent : Colors.grey,
                          side: BorderSide(
                              color: isButtonEnabled
                                  ? Colors.redAccent
                                  : Colors.grey),
                        ),
                        child: Text('Reject'),
                      ),
                      SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () {
                          if (!isButtonEnabled) {
                            return null;
                          }
                          // Handle the "Approve" button press
                          setState(() {
                            isLoading = true;
                          });
                          successMock();
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: isButtonEnabled
                              ? Color.fromARGB(255, 18, 50, 163)
                              : Colors.grey,
                          side: BorderSide(
                              color: isButtonEnabled
                                  ? Color.fromARGB(255, 18, 50, 163)
                                  : Colors.grey),
                        ),
                        child: Text('Approve'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
