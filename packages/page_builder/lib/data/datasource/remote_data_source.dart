import 'package:page_builder/mock/category_detail_mock.dart';

import '../../mock/home_mock.dart';
import '../../presentation/page/page_contract.dart';

abstract class RemoteDataSourceInterface {
  Future<PageContract?> getPage(String name);
}

class RemoteDataSource implements RemoteDataSourceInterface {
  @override
  Future<PageContract?> getPage(String name) async {
    switch (name) {
      case 'home':
        return homePage;
      case 'category_details':
        return categoryPage;
      default:
        return homePage;
    }
  }
}
