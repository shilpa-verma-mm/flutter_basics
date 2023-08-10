import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  PackageInfo packageInfo = PackageInfo(
    appName: '',
    version: '',
    buildNumber: '',
    packageName: '',
  );

  Future<PackageInfo> getAppInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }
}
