import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'graph.dart';

class EntryCard extends StatelessWidget {
  final String label;
  final double total;
  final double expense;
  const EntryCard(
      {Key? key,
      required this.label,
      required this.total,
      required this.expense})
      : super(key: key);

  static EntryCard fromDto(EntryCardContract contract) {
    return EntryCard(
      label: contract.label,
      total: contract.total,
      expense: contract.expense,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3CBAF0),
            Color(0xFF1957C7),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(minHeight: 110),
              padding: const EdgeInsets.only(bottom: 8, right: 22, left: 22),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const Graph(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      Text(
                        '70%',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          letterSpacing: 0.15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 0,
            thickness: 1,
            indent: 8,
            endIndent: 8,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF).withOpacity(0.12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Text(
                    'Despesa: ${_textFormated(expense)}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                  child: Text(
                    'Total: ${_textFormated(total)}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _textFormated(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
