import 'package:flutter/material.dart';
import 'package:flutter_base/utils/resources.dart';

class ReloadView extends StatelessWidget {
  final bool isLoading;
  final VoidCallback reloadCallBack;

  const ReloadView({Key key, this.isLoading, this.reloadCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
          child: Padding(
        padding: SizeUtil.defaultPadding,
        child: Text(
          "Đang tải.... \nVui lòng chờ!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorUtil.textGray,
          ),
        ),
      ));
    } else {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: SizeUtil.defaultPadding,
              child: Text(
                "Không tìm thấy dữ liệu!",
                style: TextStyle(
                  color: ColorUtil.textGray,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                reloadCallBack();
              },
              child: Text(
                "Tải lại",
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.grey.withAlpha(100),
            )
          ],
        ),
      );
    }
  }
}
