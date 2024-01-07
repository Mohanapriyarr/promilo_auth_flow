import 'package:fluttertoast/fluttertoast.dart';
import 'package:mac_task/app/data/utils/color_utils.dart';

Future<void> showToast({required String message}) async {
  await Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 1,
    backgroundColor: BLACK,
    textColor: WHITE,
    fontSize: 16.0,
  );
}
