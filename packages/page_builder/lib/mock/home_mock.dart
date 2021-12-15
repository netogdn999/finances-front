import 'package:domain/domain.dart';
import 'package:page_builder/presentation/page/page_contract.dart';

final homePage = PageContract(
  appBar: CustomAppBarContract(),
  components: [
    GraphicsContract(
      color: 0xFF000000,
    ),
  ]
);
