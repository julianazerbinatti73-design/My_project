/*
Versão 0.0.0

Data: 03/06/2026

Descrição do codigo: codigo original

Codigo:

import 'package:command_runner/command_runner.dart';

void main() {
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');
}

-------------------------------------------------------------------------------

Versão 0.0.1

Data: 03/06/2026

Descrição do codigo: Implementar o comando de eco colorido
#
Por fim, implemente um comando de exemplo para testar a impressão. É uma boa prática implementar exemplos de uso de um pacote em Dart para desenvolvedores que usarão seu pacote. Este exemplo cria um comando que torna a saída do console colorida.

Abra o example/command_runner_example.dartarquivo.
import 'dart:async';

import 'package:command_runner/command_runner.dart';

class PrettyEcho extends Command {
  PrettyEcho() {
    addFlag(
      'blue-only',
      abbr: 'b',
      help: 'When true, the echoed text will all be blue.',
    );
  }

  @override
  String get name => 'echo';

  @override
  bool get requiresArgument => true;

  @override
  String get description => 'Print input, but colorful.';

  @override
  String? get help =>
      'echos a String provided as an argument with ANSI coloring,';

  @override
  String? get valueHelp => 'STRING';

  @override
  FutureOr<String> run(ArgResults arg) {
    if (arg.commandArg == null) {
      throw ArgumentException(
        'This argument requires one positional argument',
        name,
      );
    }

    List<String> prettyWords = [];
    var words = arg.commandArg!.split(' ');
    for (var i = 0; i < words.length; i++) {
      var word = words[i];
      switch (i % 3) {
        case 0:
          prettyWords.add(word.titleText);
        case 1:
          prettyWords.add(word.instructionText);
        case 2:
          prettyWords.add(word.errorText);
      }
    }

    return prettyWords.join(' ');
  }
}

void main(List<String> arguments) {
  final runner = CommandRunner()..addCommand(PrettyEcho());

  runner.run(arguments);
}

Codigo:

*/

import 'dart:async';

import 'package:command_runner/command_runner.dart';

class PrettyEcho extends Command {
  PrettyEcho() {
    addFlag(
      'blue-only',
      abbr: 'b',
      help: 'When true, the echoed text will all be blue.',
    );
  }

  @override
  String get name => 'echo';

  @override
  bool get requiresArgument => true;

  @override
  String get description => 'Print input, but colorful.';

  @override
  String? get help =>
      'echos a String provided as an argument with ANSI coloring,';

  @override
  String? get valueHelp => 'STRING';

  @override
  FutureOr<String> run(ArgResults arg) {
    if (arg.commandArg == null) {
      throw ArgumentException(
        'This argument requires one positional argument',
        name,
      );
    }

    List<String> prettyWords = [];
    var words = arg.commandArg!.split(' ');
    for (var i = 0; i < words.length; i++) {
      var word = words[i];
      switch (i % 3) {
        case 0:
          prettyWords.add(word.titleText);
        case 1:
          prettyWords.add(word.instructionText);
        case 2:
          prettyWords.add(word.errorText);
      }
    }

    return prettyWords.join(' ');
  }
}

void main(List<String> arguments) {
  final runner = CommandRunner()..addCommand(PrettyEcho());

  runner.run(arguments);
}

