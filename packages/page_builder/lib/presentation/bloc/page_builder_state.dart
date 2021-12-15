part of 'page_builder_controller.dart';

abstract class PageState {}

class PageInitialState extends PageState {}

class PageLoadingPageState extends PageState {}

class PageBuildState extends PageState {
  final PageContract? page;

  PageBuildState(this.page);
}
