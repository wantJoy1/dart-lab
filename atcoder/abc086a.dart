import "dart:io";

void main(List<String> args) {
	List ab = stdin.readLineSync()!.split(" ").map((x) => int.parse(x)).toList();
	int product = ab[0] * ab[1];
	if (product % 2 == 0) {
		print("Even");
	} else {
		print("Odd");
	}
}
