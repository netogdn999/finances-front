import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_components/components/components.dart';

class CustomBottomSheet extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const CustomBottomSheet(
      {Key? key, required this.children, required this.title})
      : super(key: key);

  static CustomBottomSheet fromDto(CustomBottomSheetContract contract) {
    List<Contract> listContracts = contract.children;
    List<Widget> listWidgets = [];

    for (var contract in listContracts) {
      if (contract is ListCategoryCardContract) {
        listWidgets.add(ListCategoryCard.fromDto(contract));
      }

      if (contract is ListLaunchCardContract) {
        listWidgets.add(ListLaunchCard.fromDto(contract));
      }
    }

    return CustomBottomSheet(
      title: contract.title,
      children: listWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      enableDrag: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      builder: (_) {
        return Container(
          padding: const EdgeInsets.only(top: 9),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFC4C4C4)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 38, right: 38, bottom: 16),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF3E3E3E),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ...children,
            ],
          ),
        );
      },
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.4,
        minHeight: MediaQuery.of(context).size.height * 0.4,
        minWidth: MediaQuery.of(context).size.width,
      ),
    );
  }
}
