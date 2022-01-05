import 'package:domain/domain.dart';
import 'package:page_builder/presentation/page/page_contract.dart';

final homePage = PageContract(
    appBar: CustomAppBarContract(image: 'https://i.ibb.co/tYmgqRq/perfil.jpg'),
    components: [
      GraphicsContract(
        color: 0xFF000000,
      ),
      LaunchCardContract(
        title: "Casa do Henrique",
        height: 80,
        width: 343,
        value: 100.70,
        date: "20 Março, 09:00 AM",
      )
    ]);
