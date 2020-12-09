import 'dart:io';

Future<void> main(List<String> arguments) async {
  await puzzle1();
}

Future<void> puzzle1() async {
  var content =
      await File('/Users/oscarmartin/Repos/advent_code/bin/day2/input.txt')
          .readAsString();
  content = content.replaceAll("\n", " ");
  var split = content.split(" ");
  var finish = false;
  var index = 0;
  var passwordsValid = 0;
  while (!finish) {
    //Times
    var times = split[index];
    var timesParsed = times.split('-');
    var min = timesParsed[0];
    var max = timesParsed[1];
    //Letter
    var letter = split[index + 1].replaceAll(':', '');
    var password = split[index + 2];
    //Check password valid
    var isValid = checkPasswordValid(min, max, letter, password);
    if (isValid) passwordsValid++;
    index = index + 3;
    finish = index > split.length - 1;
  }
  print(passwordsValid);
}

bool checkPasswordValid(
    String min, String max, String letter, String password) {
  var contains = letter.allMatches(password).length;
  print(contains);
  return contains >= int.parse(min) && contains <= int.parse(max);
}
