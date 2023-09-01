import 'package:flutter/material.dart';

final List<String> manageOptionTitle = [
  "Cards",
  "Beneficiaries",
  "Debit orders",
  "Payshap",
  "iGotchU"
];
final List<String> manageOptionSubTitle = [
  "Settings & limits",
  "Edit, add, pay & remove",
  "Approve, reject, stop & reverse",
  "Manage & pay ShapIDs",
  "Add, remove, setlimits for beneficiary"
];
final List<Widget> iconsLeading = [
  const ImageIcon(
    AssetImage("assets/images/card.png"),
    size: 40,
    color: Color.fromARGB(255, 17, 52, 165),
  ),
  const ImageIcon(
    AssetImage("assets/images/ben.png"),
    size: 40,
    color: Color.fromARGB(255, 17, 52, 165),
  ),
  const ImageIcon(
    AssetImage("assets/images/debit-order.png"),
    size: 40,
    color: Color.fromARGB(255, 17, 52, 165),
  ),
  const ImageIcon(
    AssetImage("assets/images/paysharp.png"),
    size: 40,
    color: Color.fromARGB(255, 17, 52, 165),
  ),
  const ImageIcon(
    AssetImage("assets/images/iGotU.png"),
    size: 40,
    color: Color.fromARGB(255, 17, 52, 165),
  ),
];
