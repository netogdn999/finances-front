import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'graph.dart';

class CategoryCard extends StatelessWidget {
  final String label;
  final double total;
  final double expense;
  const CategoryCard(
      {Key? key,
      required this.label,
      required this.total,
      required this.expense})
      : super(key: key);

  static CategoryCard fromDto(CategoryCardContract contract) {
    return CategoryCard(
      label: contract.label,
      total: contract.total,
      expense: contract.expense,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3CBAF0),
            Color(0xFF1957C7),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.45),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 8, right: 19, left: 19),
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
            indent: 16,
            endIndent: 16,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF).withOpacity(0.12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
                  child: Text(
                    'Despesa: ${_textFormated(expense)}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 0.15,
                      height: 1.84,
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
                      height: 1.84,
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
