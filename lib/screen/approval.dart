//this is landing page for pay4it
//you will be able to navigate from here and do multiple operations like
//   1. add new beneficiary,
//   2. set limits,
//   3. select beneficairy whom you want to send the payment request.

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:pay_for_friend/data/dummy_people.dart';
import 'package:pay_for_friend/widget/approvals_list.dart';

class IGotApprovals extends StatelessWidget {
  IGotApprovals({super.key});

  //below code excutes when the user clicks on the Pay4IT list item
  void iGotApprovals(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => IGotApprovals(),
      ),
    );
  }

  final List<DummyPerson> fakePeople = List.generate(
    3,
    (index) => DummyPerson(
      name: Faker().person.firstName(),
      surname: Faker().person.lastName(),
      relationship:
          Faker().randomGenerator.element(["Friend", "Family", "Colleague"]),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 50, 163),
        elevation: 0,
        title: const Text(
          "Pending Requests",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ApprovalsList(isLoading: false, fakePeople: fakePeople),
      ),
    );
  }
}
