import 'package:flutter_base/base/base.dart';

class HomeItem extends StatelessWidget {
  final dynamic data;

  HomeItem(this.data);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data),
      leading: Icon(Icons.history),
    );
  }

}
