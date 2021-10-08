import 'dart:ui';

import 'package:finance/components/entry_manager/views/widgets/finance_bottom_sheet.dart';
import 'package:finance/components/entry_manager/views/widgets/graph.dart';
import 'package:flutter/material.dart';

class EntryManagerPage extends StatelessWidget {
  EntryManagerPage({Key? key}) : super(key: key);

  final bottomAppBarIcons = [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home)
    ),
    BottomNavigationBarItem(
      label: 'Wallet',
      icon: Icon(Icons.account_balance_wallet)
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        shadowColor: Colors.transparent,
        title: Text('User name'),
        leading: Container(
          margin: EdgeInsets.only(left: 16),
          child: Icon(
            Icons.person
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(
              Icons.search
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 4, right: 16),
            child: Icon(
              Icons.menu
            ),
          )
        ],
      ),
      body: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade300,
                Colors.blue.shade800
              ]
            )
          )
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          margin: EdgeInsets.only(left: 48, right: 48, bottom: 70, top: 56),
          child: Stack(
            children: [
              Center(
                child: Text('teste', style: TextStyle(
                  fontSize: 28,
                  color: Colors.white
                ))
              ),
              Graph()
            ]
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: bottomAppBarIcons
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        enableDrag: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28)
          )
        ),
        builder: (context) {
          return FinanceBottomSheet();
        }
      ),
    );
  }
}