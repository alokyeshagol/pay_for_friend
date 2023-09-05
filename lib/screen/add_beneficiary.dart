import 'package:flutter/material.dart';
import 'package:pay_for_friend/models/beneficiaries.dart';

class AddBeneficiary extends StatefulWidget {
  AddBeneficiary({super.key, required this.addBeneficiary});

  final void Function(Beneficiary beneficiary) addBeneficiary;

  State<AddBeneficiary> createState() {
    return _AddBeneficiaryState();
  }
}

class _AddBeneficiaryState extends State<AddBeneficiary> {
  final _accountNoController = TextEditingController();
  final _beneficiaryNameController = TextEditingController();
  final _limitController = TextEditingController();

  void dispose() {
    _accountNoController.dispose();
    _beneficiaryNameController.dispose();
    _limitController.dispose();
    super.dispose();
  }

  void onSaveExpense() {
    final enteredLimit = double.tryParse(_limitController.text);
    widget.addBeneficiary(
      Beneficiary(
        bpId: "bpId",
        beneficiaryName: _beneficiaryNameController.text,
        accountNumber: _accountNoController.text,
        limit: enteredLimit!,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            child: Container(
              color: Color.fromARGB(255, 18, 50, 163),
              child: Column(children: [
                ListTile(
                  leading: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back) // the arrow back icon
                        ),
                  ),
                  title: Center(
                    child: const Text(
                      "New Beneficiary Details",
                      style: TextStyle(color: Colors.white70),
                    ), // Your desired title
                  ),
                ),
              ]),
            ),
          ),
          TextField(
            controller: _accountNoController,
            maxLength: 12,
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            decoration: const InputDecoration(
              label: Text("Account Number"),
            ),
          ),
          TextField(
            controller: _beneficiaryNameController,
            decoration: const InputDecoration(
              label: Text("Name"),
            ),
          ),
          TextField(
            controller: _limitController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              label: Text("Limit"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 18, 50, 163),
                  ),
                ),
                onPressed: () {
                  onSaveExpense();
                },
                child: const Text("Save Beneficiary"),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 18, 50, 163),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
