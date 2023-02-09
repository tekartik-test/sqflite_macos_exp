import 'dart:io';

import 'package:path/path.dart';
import 'package:process_run/shell.dart';
import 'package:tekartik_build_menu_flutter/app_build_menu.dart';

var appTest1Path = join('.dart_tool', 'sqflite_test', 'exp1');

/// Added here to test on an exter
Future main(List<String> arguments) async {
  var appPath = join('..', 'app_build_menu_example');
  mainMenu(arguments, () {
    if (Platform.isWindows || Platform.isLinux) {
      item('build and run marker', () async {
        await createProject(appPath);
        await buildProject(appPath,
            target: 'lib/create_file_and_exit_main.dart');
        await runBuiltProject(appPath);
      });
      item('build and run example', () async {
        await createProject(appPath);
        await buildProject(appPath);
        await runBuiltProject(appPath);
      });
    }
    menu('exp1', () {
      var appPath = appTest1Path;
      item('create project', () async {
        await deleteDir(appPath);
        var shell = Shell();

        await shell.run(
            'flutter create --template app --platforms ios --ios-language objc ${shellArgument(appPath)}');
      });
      item('add sqflite as path dep', () {});
    });
    menuAppContent(path: appTest1Path);
  });
}
