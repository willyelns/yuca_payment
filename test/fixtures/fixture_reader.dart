import 'dart:io';
import 'package:path/path.dart' show join;

String fixture(String path, String name) =>
    File(join('./test', 'fixtures', path, name)).readAsStringSync();

String fixtureFeature(String feature, String name) =>
    File(join('./test', 'fixtures', 'features', feature, name))
        .readAsStringSync();
