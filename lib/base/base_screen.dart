import 'package:flutter/material.dart';
import 'base_view_model.dart';

// ignore: must_be_immutable
abstract class BaseScreen<V extends BaseViewModel> extends StatefulWidget {
  V viewModel;

  V getViewModel();

  Widget buildWidget();

  @override
  State<StatefulWidget> createState() {
    viewModel = getViewModel();
    return new BaseState();
  }
}

class BaseState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.viewModel == null) {
      //TODO for hot reload
      widget.viewModel = widget.getViewModel();
    }
    return widget.buildWidget();
  }

  @override
  void initState() {
    widget.viewModel.initState();
    super.initState();
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }
}
