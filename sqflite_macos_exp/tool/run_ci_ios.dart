import 'package:tekartik_build_menu_flutter/app_build_menu.dart';
import 'package:process_run/shell_run.dart';
import 'example_build_menu.dart';

Future<void> main() async {
  var appPath = appTest1Path;
  await deleteDir(appPath);
  var shell = Shell();

  await shell.run('flutter create --template app');
}
