import 'package:domain/domain.dart';
import 'package:page_builder/presentation/page/page_contract.dart';

final categoryPage = PageContract(
  appBar: CustomAppBarContract(image: 'https://i.ibb.co/tYmgqRq/perfil.jpg'),
  bottomSheet: CustomBottomSheetContract(title: 'Aluguel', children: [
    ListLaunchCardContract(
      children: [
        LaunchCardContract(
          title: "Casa do Henrique",
          height: 80,
          width: 343,
          value: 100.70,
          date: "20 Março, 09:00 AM",
        ),
        LaunchCardContract(
          title: "Casa do Henrique",
          height: 80,
          width: 343,
          value: 100.70,
          date: "20 Março, 09:00 AM",
        ),
        LaunchCardContract(
          title: "Casa do Henrique",
          height: 80,
          width: 343,
          value: 100.70,
          date: "20 Março, 09:00 AM",
        ),
           LaunchCardContract(
          title: "Casa do Henrique",
          height: 80,
          width: 343,
          value: 100.70,
          date: "20 Março, 09:00 AM",
        ),
      ],
    ),
  ]),
 bottomNavBar: CustomNavBarContract(
        backgroundColor: 0xffFEFEFE,
        items: [
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED, label: 'home'),
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED, label: 'wallet'),
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED, label: 'entries'),
          CustomNavBarItemContract(icon: 0xe2e3, color: 0xffD6E0ED, label: 'settings')
        ]),  components: [
    GraphicsContract(
      color: 0xFFFFFFFF,
    ),
  ],
);
