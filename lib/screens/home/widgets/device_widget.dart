import 'package:cadevo/constants/asset_path.dart';
import 'package:cadevo/models/device.dart';
import 'package:cadevo/providers/app.dart';
import 'package:cadevo/screens/home/widgets/single_device_draggable.dart';
import 'package:cadevo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeviceWidget extends StatelessWidget {
  final DeviceModel device;

  const DeviceWidget({Key key, @required this.device}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of(context);
    return ListTile(
      onTap: () {
        appProvider.changeActiveDevice(device);
        appProvider.changeActiveDraggableWidget(SingleDeviceDraggable());
      },
      leading: Image.asset(
        _returnImage(),
        width: 45,
      ),
      title: CustomText(
        text: device.name,
        size: 18,
        weight: FontWeight.bold,
      ),
      subtitle: CustomText(
        text: "Last log 2 days ago",
        color: Colors.grey,
      ),
    );
  }

  String _returnImage() {
    if (device.os == "android") {
      return android;
    } else {
      return iphone;
    }
  }
}