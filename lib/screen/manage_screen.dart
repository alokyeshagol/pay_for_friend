import 'package:flutter/material.dart';
import 'package:pay_for_friend/data/manage_options_menu.dart';
import 'package:pay_for_friend/screen/pay4it.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({super.key});

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
    return ListView.builder(
        itemCount: manageOptionTitle.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 4) {
                _onPay4IT(context);
              }
            },
            child: ListTile(
              leading: iconsLeading[index],
              title: Text(
                manageOptionTitle[index],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(manageOptionSubTitle[index]),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color.fromARGB(255, 105, 147, 222),
                size: 15,
              ),
            ),
          );
        });
  }
}
