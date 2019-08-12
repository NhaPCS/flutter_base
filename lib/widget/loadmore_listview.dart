import 'package:flutter/material.dart';
import 'package:flutter_base/base/base.dart';

typedef ReloadCallback = void Function(int page);
typedef ItemLoadMoreBuilder = Widget Function(
    BuildContext context, dynamic data);

class LoadMoreListView extends StatelessWidget {
  final ItemLoadMoreBuilder itemBuilder;
  final ReloadCallback reloadCallback;
  final EdgeInsetsGeometry padding;
  final Stream<List<dynamic>> stream;

  int page = 0;
  int totalPage = 0;
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  List<dynamic> _listData = new List();

  LoadMoreListView(
      {Key key,
      @required this.itemBuilder,
      @required this.stream,
      @required this.reloadCallback,
      this.padding,
      this.totalPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    initState();
    return RefreshIndicator(
        child: StreamBuilder(
            stream: stream,
            builder: (context, AsyncSnapshot<List<dynamic>> data) {
              isPerformingRequest = false;
              if (data.hasData && data.data.isNotEmpty) if (page == 0)
                _listData = data.data;
              else
                _listData.addAll(data.data);
              return ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return itemBuilder(context, _listData[index]);
                },
                itemCount: data.data == null ? 0 : data.data.length,
              );
            }),
        onRefresh: () {
          page = 0;
          reloadCallback(page);
          return Future.delayed(Duration(milliseconds: 1000));
        });
  }

  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!isPerformingRequest && (totalPage <= 0 || page < totalPage)) {
          print("TOTAL $totalPage  $page");
          isPerformingRequest = true;
          page++;
          reloadCallback(page);
        }
      }
    });
  }
}
