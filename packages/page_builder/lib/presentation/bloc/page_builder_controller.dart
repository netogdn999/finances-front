import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_builder/data/repositories/repository.dart';
import 'package:page_builder/presentation/page/page_contract.dart';

part 'page_builder_event.dart';
part 'page_builder_state.dart';

class PageBuilderController extends Bloc<PageEvent, PageState> {
  final RepositoryInterface repository;

  PageBuilderController(this.repository) : super(PageInitialState()) {
    on<PageBuildEvent>(_buildEvent);
  }

  FutureOr<void> _buildEvent(PageBuildEvent event, Emitter<PageState> emit) async {
    emit(PageLoadingPageState());
    final result = await repository.getPage(event.page);
    emit(PageBuildState(result));
  }
}
