import "dart:io";

void main(List<String> args) {
  List<int> s = stdin.readLineSync()!.split("").map((e) => int.parse(e)).toList();
  int ans = s.reduce((value, element) => value + element);
  print(ans);
}