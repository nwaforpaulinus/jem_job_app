import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

requestPermission() async {
  var status = await Permission.location.status;
  if (status.isDenied) {
    if (await Permission.location.request().isGranted) {
return status;
    } else {
      if (kDebugMode) {
        print("Location Permission is denied.");
      }
      return status;
    }
  } else if (status.isGranted) {
    print("Permission is already granted.");
    return status;
  } else if (status.isPermanentlyDenied) {
    //permission is permanently denied.
    print("Permission is permanently denied");
    return status;
  } else if (status.isRestricted) {
    //permission is OS restricted.
    print("Permission is OS restricted.");
    return status;

  }
}
