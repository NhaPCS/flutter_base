import 'package:flutter_base/base/base.dart';
import 'package:flutter_base/view_model/home_view_model.dart';
import 'package:flutter_base/widget/widget.dart';
import 'package:flutter_base/item/home_item.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  @override
  HomeViewModel getViewModel() {
    return new HomeViewModel();
  }

  @override
  Widget buildWidget() {
    return Scaffold(
      backgroundColor: Colors.red,
      body: LoadMoreListView(
          itemBuilder: (context, data) {
            return HomeItem(data);
          },
          stream: viewModel.listStoriesController.stream,
          reloadCallback: (page){

          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        viewModel.reload();
      }),
    );
  }
}
