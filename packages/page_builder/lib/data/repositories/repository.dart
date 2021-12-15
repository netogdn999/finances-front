import '../datasource/remote_data_source.dart';
import '../../presentation/page/page_contract.dart';

abstract class RepositoryInterface {
  Future<PageContract?> getPage(String name);
}

class Repository implements RepositoryInterface {
  final RemoteDataSourceInterface dataSource;

  Repository(this.dataSource);

  @override
  Future<PageContract?> getPage(String name) async => dataSource.getPage(name);
}
