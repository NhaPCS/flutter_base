import 'package:flutter_base/base/base.dart';

class HomeViewModel extends BaseViewModel{

  StreamController<List<dynamic>> listStoriesController = new StreamController();


  void getList() {
    List<dynamic> arr = ["nha", "b", "c", "d"];
    listStoriesController.add(arr);
  }

  void reload() {
    List<dynamic> arr = ["a", "fa", "ga", "MMM"];
    listStoriesController.add(arr);
  }

  @override
  void dispose() {
    listStoriesController?.close();
  }

  @override
  void initState() {
    getList();
  }

}