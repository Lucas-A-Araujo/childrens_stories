import 'dart:convert';

import 'package:childrens_stories/src/networks/constants.dart';
import 'package:childrens_stories/src/packages/local_storage_packages.dart';
import 'package:childrens_stories/src/utils/key_names_utils.dart';

class InterceptorsApp {
  final LocalStoragePackages _local = LocalStoragePackages();
  headerToken() async {
    String? tokenString = await _local.readLocal(key: KeyNamesUtils.token);

    Map<String, String> header = {};

    if (tokenString != '') {
      String? token = json.decode(tokenString!);

      header['Authorization'] = (token != null ? 'Bearer $token' : null)!;
      header['Content-Type'] = 'application/json';
      Constants.headerConstAPI = header;
    }

    return header;
  }
}
