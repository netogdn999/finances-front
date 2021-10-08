import 'package:finance/components/entry_manager/views/widgets/graph.dart';
import 'package:flutter/material.dart';

class EntryCard extends StatelessWidget {
  final String label;
  final double total;
  final double gasto;
  const EntryCard({Key? key, required this.label, required this.total, required this.gasto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue
      ),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(label, style: TextStyle(
              fontSize: 14,
              color: Colors.white
            )),
            Container(
              constraints: BoxConstraints(
                minHeight: 120,
                minWidth: 120
              ),
              child: Graph(width: 12)
            ),
            Container(
              constraints: BoxConstraints(minWidth: 120),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white,
                    width: 1
                  )
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text('Total: ', style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                    )),
                    Text('R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}', textAlign: TextAlign.start, style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                    ))
                  ]),
                  Row(children: [
                    Text('Gasto: ', style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                    )),
                    Container(
                      child: Text('R\$ ${gasto.toStringAsFixed(2).replaceAll('.', ',')}', textAlign: TextAlign.start, style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                      )),
                    )
                  ])
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}