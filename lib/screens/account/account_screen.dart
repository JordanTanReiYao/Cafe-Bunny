import 'package:Cafe_Bunny/components/custom_bottom_nav_bar.dart';
import '../account/components/body.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = "/account";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.account),
    );
  }
}
