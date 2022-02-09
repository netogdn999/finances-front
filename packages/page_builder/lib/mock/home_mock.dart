import 'package:domain/domain.dart';
import 'package:page_builder/presentation/page/page_contract.dart';

final homePage = PageContract(
    appBar: CustomAppBarContract(image: 'https://i.ibb.co/tYmgqRq/perfil.jpg'),
    bottomSheet: CustomBottomSheetContract(
      title: 'Categorias',
      children: [
        ListCategoryCardContract(
          children: [
            CategoryCardContract(
              label: "Aluguel",
              total: 80,
              expense: 604,
            ),
            CategoryCardContract(
              label: "Aluguel",
              total: 800,
              expense: 903,
            ),
            CategoryCardContract(
              label: "Aluguel",
              total: 400,
              expense: 603,
            ),
            CategoryCardContract(
              label: "Aluguel",
              total: 80,
              expense: 95,
            ),
          ],
        ),
      ],
    ),
    bottomNavBar: CustomNavBarContract(
        backgroundColor: 0xffFEFEFE,
        items: [
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED, label: 'home'),
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED, label: 'wallet'),
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED, label: 'entries'),
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED, label: 'settings')
        ]),
    components: [
      GraphicsContract(
        color: 0xFFFFFFFF,
      ),
    ]);
