part of 'page_builder_controller.dart';

abstract class PageEvent {}

class PageBuildEvent extends PageEvent {
  final String page;

  PageBuildEvent(this.page);
}
