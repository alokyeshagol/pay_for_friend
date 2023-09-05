import 'package:flutter/material.dart';

import 'package:pay_for_friend/screen/add_beneficiary.dart';
import 'package:pay_for_friend/models/beneficiaries.dart';
import 'package:pay_for_friend/data/dummy_beneficiary.dart';

class ManageBeneficiary extends StatefulWidget {
  State<ManageBeneficiary> createState() {
    return _ManageBeneficiaryState();
  }
}

class _ManageBeneficiaryState extends State<ManageBeneficiary> {
  void _openAddBeneficiaryOverLay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddBeneficiary(addBeneficiary: _addBeneficiary),
    );
  }

  void _addBeneficiary(Beneficiary beneficiary) {
    setState(() {
      availableBeneficaries.add(beneficiary);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Beneficiary"),
        backgroundColor: const Color.fromARGB(255, 18, 50, 163),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _openAddBeneficiaryOverLay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(thickness: 2);
          },
          itemCount: availableBeneficaries.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                color: Colors.red,
              ),
              key: ValueKey<Beneficiary>(availableBeneficaries[index]),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  availableBeneficaries.removeAt(index);
                });
              },
              child: ListTile(
                  title: Text(
                    availableBeneficaries[index].beneficiaryName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text("Limit: " +
                      availableBeneficaries[index].limit.toString()),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20,
                    ),
                  )),
            );
          }),
    );
  }
}
