import 'package:domain/domain.dart';
import 'package:page_builder/presentation/page/page_contract.dart';

final homePage = PageContract(
    appBar: CustomAppBarContract(image: 'https://i.ibb.co/tYmgqRq/perfil.jpg'),
    bottomSheet: CustomBottomSheetContract(
      title: 'Categorias',
      children: [
        ListEntryCardContract(
          children: [
            EntryCardContract(
              label: "Aluguel",
              total: 80,
              expense: 604,
            ),
            EntryCardContract(
              label: "B3",
              total: 800,
              expense: 903,
            ),
            EntryCardContract(
              label: "Alimentação",
              total: 400,
              expense: 603,
            ),
            EntryCardContract(
              label: "Transporte",
              total: 80,
              expense: 95,
            ),
          ],
        ),
      ],
    ),
    bottomNavBar: CustomNavBarContract(
        containerHeight: 70,
        backgroundColor: 0xffFEFEFE,
        activeColor: 0xff2270D2,
        inactiveColor: 0xffD6E0ED,
        items: [
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED),
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED),
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED),
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED)
        ]),
    components: [
      GraphicsContract(
        color: 0xFFFFFFFF,
      ),
    ]);
