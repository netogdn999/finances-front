import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_builder/page_builder_handler.dart';
import 'presentation/bloc/page_builder_controller.dart';

class PageBuilderWidgets extends StatefulWidget {
  final String page;
  final PageBuilderHandler handler = PageBuilderHandler();

  PageBuilderWidgets({Key? key, required this.page}) : super(key: key);

  @override
  State<PageBuilderWidgets> createState() => _PageBuilderWidgetsState();
}

class _PageBuilderWidgetsState extends State<PageBuilderWidgets> {
  @override
  void initState() {
    super.initState();
    context.read<PageBuilderController>().add(PageBuildEvent(widget.page));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBuilderController, PageState>(
      buildWhen: (_, state) {
        if (state is PageBuildState) {
          return state.page != null;
        }
        return true;
      },
      builder: (_, state) {
        if (state is PageBuildState) {
          return Scaffold(
            appBar: widget.handler.getAppBar(state.page!),
            bottomSheet: widget.handler.getBottomSheet(state.page!),
            bottomNavigationBar: widget.handler.getBottomNavBar(state.page!),
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                  colors: [
                    Color(0xFF3CBAF0),
                    Color(0xFF1957C7),
                  ],
                  tileMode: TileMode.clamp
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: widget.handler.getWidgets(state.page!),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
