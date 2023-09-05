import 'package:flutter/material.dart';
import 'package:pay_for_friend/data/dummy_people.dart';
import 'package:pay_for_friend/widget/approvals_item.dart';

class ApprovalsList extends StatelessWidget {
  final bool isLoading;
  final List<DummyPerson> fakePeople;

  const ApprovalsList(
      {Key? key, required this.isLoading, required this.fakePeople})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : ListView.builder(
            itemCount: fakePeople.length,
            itemBuilder: (BuildContext context, int index) {
              return ApprovalItem(person: fakePeople[index], index: index);
            },
          );
  }
}
