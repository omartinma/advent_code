import 'dart:io';

Future<void> main(List<String> arguments) async {
  await puzzle1();
}

Future<void> puzzle1() async {
  var content =
      await File('/Users/oscarmartin/Repos/advent_code/bin/day1/input.txt')
          .readAsString();
  var split = content.split('\n');
  split.removeLast();
  var numbers = split.map((e) => int.parse(e)).toList();
  bool found = false;
  for (var i = 0; i < numbers.length; i++) {
    for (var j = 0; j < numbers.length; j++) {
      if (i == j) continue;
      var sum = numbers[i] + numbers[j];
      if (sum == 2020) {
        found = true;
        print("Found: ${numbers[i]} ${numbers[j]}");
        var result = numbers[i] * numbers[j];
        print("Result: $result");
        break;
      }
    }
    if (found) break;
  }
}

Future<void> puzzle2() async {
  var content = await File('/Users/oscarmartin/Repos/advent_code/bin/input.txt')
      .readAsString();
  var split = content.split('\n');
  split.removeLast();
  var numbers = split.map((e) => int.parse(e)).toList();
  var found = false;
  for (var i = 0; i < numbers.length; i++) {
    for (var j = 0; j < numbers.length; j++) {
      for (var k = 0; k < numbers.length; k++) {
        if (i == j || j == k || i == k) continue;
        var sum = numbers[i] + numbers[j] + numbers[k];
        if (sum == 2020) {
          found = true;
          print("Found: ${numbers[i]} ${numbers[j]} ${numbers[k]}");
          var result = numbers[i] * numbers[j] * numbers[k];
          print("Result: $result");
          break;
        }
      }
      if (found) break;
    }
    if (found) break;
  }
}

day2Part1() {}
