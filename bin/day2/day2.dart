import 'dart:io';

Future<void> main(List<String> arguments) async {
  await puzzle2();
}

Future<List<String>> readFileParsed() async {
  var content =
      await File('/Users/oscarmartin/Repos/advent_code/bin/day2/input.txt')
          .readAsString();
  content = content.replaceAll('\n', ' ');
  return content.split(' ');
}

Future<void> puzzle1() async {
  var finish = false;
  var index = 0;
  var passwordsValid = 0;
  final split = await readFileParsed();
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
    var isValid = checkPasswordValidPuzzle1(min, max, letter, password);
    if (isValid) passwordsValid++;
    index = index + 3;
    finish = index > split.length - 1;
  }
  print(passwordsValid);
}

puzzle2() async {
  var finish = false;
  var index = 0;
  var passwordsValid = 0;
  final split = await readFileParsed();
  while (!finish) {
    //Times
    var times = split[index];
    var timesParsed = times.split('-');
    var positionToContain = int.parse(timesParsed[0]) - 1;
    var positionToNotContain = int.parse(timesParsed[1]) - 1;
    //Letter
    var letter = split[index + 1].replaceAll(':', '');
    var password = split[index + 2];
    //Check password valid
    var isValid = (password[positionToContain] == letter &&
            password[positionToNotContain] != letter) ||
        (password[positionToContain] != letter &&
            password[positionToNotContain] == letter);
    print("$times $letter $password $isValid");
    if (isValid) passwordsValid++;
    index = index + 3;
    finish = index > split.length - 1;
  }
  print(passwordsValid);
}

bool checkPasswordValidPuzzle1(
    String min, String max, String letter, String password) {
  var contains = letter.allMatches(password).length;
  print(contains);
  return contains >= int.parse(min) && contains <= int.parse(max);
}
