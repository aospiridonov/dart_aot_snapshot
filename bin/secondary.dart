import 'dart:developer' as dev;

//dart compile aot-snapshot bin/secondary.dart -o secondary.aot
void main(List<String>? arguments, Object? message) {
  final message = 'Hello, I am secondary';
  print(message);
  dev.log(message);
}
