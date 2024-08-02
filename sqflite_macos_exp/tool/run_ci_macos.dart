import 'package:tekartik_build_menu_flutter/app_build_menu.dart';
import 'package:process_run/shell_run.dart';
import 'example_build_menu.dart';
import 'package:path/path.dart';

Future<void> main() async {
  var appPath = appTest1Path;
  await deleteDir(appPath);
  var shell = Shell().cd(dirname(appPath));

  await shell.run(
      'flutter create --template app --platforms macos ${shellArgument(basename(appPath))}.');
}
