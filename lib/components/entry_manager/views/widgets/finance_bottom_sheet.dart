import 'package:finance/components/entry_manager/views/widgets/entry_card.dart';
import 'package:flutter/material.dart';

class FinanceBottomSheet extends StatelessWidget {
  const FinanceBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.34,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 28),
            child: Text('Despesas', style: TextStyle(
              fontSize: 25
            ))
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8, right: 8, bottom: 45),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) => 
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: EntryCard(
                        label: 'Teste $index',
                        total: index * 1000,
                        gasto: (index * 10000) * 0.5,
                      )
                    )
                  )
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}