import 'package:flutter/material.dart';
import 'package:pay_for_friend/data/dummy_people.dart';
import 'package:pay_for_friend/screen/pending_request_detail.dart';

class ApprovalItem extends StatelessWidget {
  final DummyPerson person;
  final int index;

  const ApprovalItem({super.key, required this.person, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => PendingRequestDetail(
              requestDetails: {"name": person.name, "surname": person.surname},
              index: index,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            person.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color.fromARGB(255, 105, 147, 222),
            size: 15,
          ),
          subtitle: Text(person.relationship),
        ),
      ),
    );
  }
}
