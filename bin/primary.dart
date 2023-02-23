import 'dart:io' as io;
import 'dart:isolate';

import 'package:path/path.dart' as path;

//dart compile aot-snapshot bin/secondary.dart -o secondary.aot
//dart compile exe bin/primary.dart -o primary.exe
//./primary.exe

void main(List<String> arguments) => Future<void>(() async {
      print('primary start');
      final uri =
          Uri.parse(path.join(io.Directory.current.path, 'secondary.aot'));
      final isolate = await Isolate.spawnUri(
        uri,
        arguments,
        null,
        debugName: 'secondary',
      );
      await Future.delayed(const Duration(seconds: 3));
      isolate.kill();
      print('primary end');
    });
