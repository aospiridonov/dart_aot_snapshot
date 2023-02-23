# An example of using the aot snapshot with spawn isolate

## Primary

``dart compile exe bin/primary.dart -o primary.exe``

``./primary.exe``

bin/primary.dart

```dart
import 'dart:io' as io;
import 'dart:isolate';

import 'package:path/path.dart' as path;

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
```

## Secondary

``dart compile aot-snapshot bin/secondary.dart -o secondary.aot``

bin/secondary.dart

```dart
import 'dart:developer' as dev;

void main(List<String>? arguments, Object? message) {
  final message = 'Hello, I am secondary';
  print(message);
  dev.log(message);
}
```
