import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domain/entities/entities.dart';

class LaunchCard extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final double value;
  final String date;

  const LaunchCard(
      {Key? key,
      required this.title,
      required this.height,
      required this.width,
      required this.value,
      required this.date})
      : super(key: key);

  static LaunchCard fromDto(LaunchCardContract contract) {
    return LaunchCard(
      date: contract.date,
      height: contract.height,
      width: contract.width,
      title: contract.title,
      value: contract.value,
    );
  }

  Color _color(double value) {
    return value > 0 ? const Color(0xff39AE2E) : const Color(0xffCD4F4F);
  }

  String _value(double value) {
    return "R\$ ${value > 0 ? '+' : '-'} ${value.toString()}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 22),
      decoration: BoxDecoration(
          color: const Color(0xfffefefe),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: const Color(0xff525252).withOpacity(0.3),
              offset: const Offset(2, 4),
              spreadRadius: 0,
            ),
          ]
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                date,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _value(value),
                style: GoogleFonts.poppins(
                  color: _color(value),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
