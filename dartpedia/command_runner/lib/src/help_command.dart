/*-----------------------------------------------------------------------------

Informações

O arquivo `help_command.dart` faz parte do projeto Dartpedia.

A classe `HelpCommand` é responsável por exibir informações de uso e ajuda dos comandos disponíveis na aplicação CLI desenvolvida em Dart.

Arquivo principal: `help_command.dart`

Localização do arquivo: `/dartpedia/command_runner/lib/src`

Outras informações importantes sobre o componente:

Site:

Autor: Juliana Zerbinatti Sendon Garrido <julianazerbinatti73@gmail.com>

Manutenção:

-------------------------------------------------------------------------------

Funcionamento

Inicialmente o command_runner, ao ser executado, serve como a biblioteca principal que vai gerenciar e estruturar as regras de POO do nosso interpretador. 
Este arquivo especifico implementa um comando especializado de ajuda (HelpCommand).

Dentro da pasta dartpedia em dartpedia/command_runner rode o comando dart analyze; o analisador do Dart deve verificar o arquivo help_command.dart e validar que a estrutura da nova
classe nao possui erros de sintaxe ou de compilacao.

Obs. Importante ! Este aplicativo esta em desenvolvimento e ao longo do tempo o comportamento do aplicativo pode mudar. Este arquivo depende da biblioteca nativa 'dart:async' e possui vinculo direto com o arquivo 'arguments.dart'.

-------------------------------------------------------------------------------
Dicionario do versionamento:

v = versao

0 = Inicio do versionamento

. = Implementacao de versionamento

1 = Proxima versao, 2, proxima versao, e assim por diante.
-------------------------------------------------------------------------------

Historico

-------------------------------------------------------------------------------

Versao: 0.0.0

Data: 21/05/2026

Descricao do codigo: Criar um comando de ajuda

Crie um HelpCommand objeto que estenda a Commandclasse e imprima informações de uso.

Crie o arquivo command_runner/lib/src/help_command.dart.

Codigo: // Arquivo help_command.dart inicializado.

-------------------------------------------------------------------------------

versao: 0.0.1

Data: 21/05/2026

Descrição do codigo: Criar um comando de ajuda.

Adicione o seguinte código a command_runner/lib/src/help_command.dart:

import 'dart:async';

import 'arguments.dart';

// Prints program and argument usage.
//
// When given a command as an argument, it prints the usage of
// that command only, including its options and other details.
// When the flag 'verbose' is set, it prints options and details for all commands.
//
// This command isn't automatically added to CommandRunner instances.
// Packages users should add it themselves with [CommandRunner.addCommand],
// or create their own command that prints usage.

class HelpCommand extends Command {
  HelpCommand() {
    addFlag(
      'verbose',
      abbr: 'v',
      help: 'When true, this command will print each command and its options.',
    );
    addOption(
      'command',
      abbr: 'c',
      help:
          "When a command is passed as an argument, prints only that command's verbose usage.",
    );
  }
  @override
  String get name => 'help';

  @override
  String get description => 'Prints usage information to the command line.';

  @override
  String? get help => 'Prints this usage information';

  @override
  FutureOr<Object?> run(ArgResults args) async {
    var usage = runner.usage;
    for (var command in runner.commands) {
      usage += '\n ${command.usage}';
    }

    return usage;
  }
}

A HelpCommandclasse demonstra os benefícios da herança. Ela utiliza os métodos da classe pai para configurar suas opções, sobrescreve o runmétodo abstrato e acessa o runnerestado para gerar a mensagem de uso.

Codigo:

import 'dart:async';

import 'arguments.dart';

// Prints program and argument usage.
//
// When given a command as an argument, it prints the usage of
// that command only, including its options and other details.
// When the flag 'verbose' is set, it prints options and details for all commands.
//
// This command isn't automatically added to CommandRunner instances.
// Packages users should add it themselves with [CommandRunner.addCommand],
// or create their own command that prints usage.

class HelpCommand extends Command {
  HelpCommand() {
    addFlag(
      'verbose',
      abbr: 'v',
      help: 'When true, this command will print each command and its options.',
    );
    addOption(
      'command',
      abbr: 'c',
      help:
          "When a command is passed as an argument, prints only that command's verbose usage.",
    );
  }
  @override
  String get name => 'help';

  @override
  String get description => 'Prints usage information to the command line.';

  @override
  String? get help => 'Prints this usage information';

  @override
  FutureOr<Object?> run(ArgResults args) async {
    var usage = runner.usage;
    for (var command in runner.commands) {
      usage += '\n ${command.usage}';
    }

    return usage;
  }
}

Saida padrao ao executar o codigo:

Comando: dart analyze

Saida: Analyzinf command_runner... 
No issues found!

-------------------------------------------------------------------------------

Versao: 0.0.2

Data: 09/06/2026

Descricao do codigo: Melhorar a HelpCommand produção

Aprimore a documentação HelpCommand para fornecer informações de uso mais detalhadas, incluindo opções e suas descrições. Isso facilitará a compreensão do uso do seu aplicativo de linha de comando pelos usuários.

1. Abra o command_runner/lib/src/help_command.dart arquivo.

2. Adicione as importações para `color` console.dart e `color` exceptions.dart no início do arquivo. Voce precisa delas para usar as extensões de cor e para gerar um erro ArgumentException.

import 'dart:async';

import 'package:command_runner/command_runner.dart';

import 'console.dart';
import 'exceptions.dart';

3. Substitua o método existente run pelo seguinte. Esta nova versão utiliza um `std::vector` StringBuffer para construir a string de ajuda de forma eficiente e inclui lógica para lidar com saídas detalhadas.

@override
FutureOr<String> run(ArgResults args) async {
  final buffer = StringBuffer();
  buffer.writeln(runner.usage.titleText);

  if (args.flag('verbose')) {
    for (var cmd in runner.commands) {
      buffer.write(_renderCommandVerbose(cmd));
    }

    return buffer.toString();
  }

  if (args.hasOption('command')) {
    var (:option, :input) = args.getOption('command');

    var cmd = runner.commands.firstWhere(
      (command) => command.name == input,
      orElse: () {
        throw ArgumentException(
          'Input ${args.commandArg} is not a known command.',
        );
      },
    );

    return _renderCommandVerbose(cmd);
  }

  // Verbose is false and no arg was passed in, so print basic usage.
  for (var command in runner.commands) {
    buffer.writeln(command.usage);
  }

  return buffer.toString();
}

StringBuffer é uma classe Dart que permite construir strings de forma eficiente. Ela oferece melhor desempenho do que o + operador `concat`, especialmente ao realizar várias concatenações dentro de um loop.

4. Adicione o _renderCommandVerbose método auxiliar privado à HelpCommand classe. Este método formata a saída detalhada para um único comando.

String _renderCommandVerbose(Command cmd) {
  final indent = ' ' * 10;
  final buffer = StringBuffer();
  buffer.writeln(cmd.usage.instructionText); //abbr, name: description
  buffer.writeln('$indent ${cmd.help}');
  if (cmd.valueHelp != null) {
    buffer.writeln(
      '$indent [Argument] Required? ${cmd.requiresArgument}, Type: ${cmd.valueHelp}, Default: ${cmd.defaultValue ?? 'none'}',
    );
  }
  buffer.writeln('$indent Options:');
  for (var option in cmd.options) {
    buffer.writeln('$indent ${option.usage}');
  }
  return buffer.toString();
}

Codigo:

import 'dart:async';

import 'arguments.dart';

import 'package:command_runner/command_runner.dart';

import 'console.dart';

import 'exceptions.dart';


class HelpCommand extends Command {
  @override
  String get name => 'help';

  @override
  String get description => 'Displays help information.';

  @override
  String? get help => 'Displays help information.';

  @override
  String? get defaultValue => null;

  @override
  String? get valueHelp => null;

  @override
FutureOr<String> run(ArgResults args) async {
  final buffer = StringBuffer();
  buffer.writeln(runner.usage.titleText);

  if (args.flag('verbose')) {
    for (var cmd in runner.commands) {
      buffer.write(_renderCommandVerbose(cmd));
    }

    return buffer.toString();
  }

  if (args.hasOption('command')) {
    var (:option, :input) = args.getOption('command');

    var cmd = runner.commands.firstWhere(
      (command) => command.name == input,
      orElse: () {
        throw ArgumentException(
          'Input ${args.commandArg} is not a known command.',
        );
      },
    );

    return _renderCommandVerbose(cmd);
  }

for (var command in runner.commands) {
    buffer.writeln(command.usage);
  }

  return buffer.toString();
}

String _renderCommandVerbose(Command cmd) {
  final indent = ' ' * 10;
  final buffer = StringBuffer();
  buffer.writeln(cmd.usage.instructionText); //abbr, name: description
  buffer.writeln('$indent ${cmd.help}');
  if (cmd.valueHelp != null) {
    buffer.writeln(
      '$indent [Argument] Required? ${cmd.requiresArgument}, Type: ${cmd.valueHelp}, Default: ${cmd.defaultValue ?? 'none'}',
    );
  }
  buffer.writeln('$indent Options:');
  for (var option in cmd.options) {
    buffer.writeln('$indent ${option.usage}');
  }
  return buffer.toString();
}

Saida padrao ao executar o codigo:

Comando: dart analyze

Saida: Analyzinf command_runner... 
No issues found!

-------------------------------------------------------------------------------
*/

// Codigo ate aqui:

// Codigo:

import 'dart:async';

import 'arguments.dart';
import 'console.dart';
import 'exceptions.dart';

class HelpCommand extends Command {
  HelpCommand() {
    addFlag(
      'verbose',
      abbr: 'v',
      help: 'Displays detailed help information.',
    );

    addOption(
      'command',
      abbr: 'c',
      help: 'Display help for a specific command.',
    );
  }

  @override
  String get name => 'help';

  @override
  String get description => 'Displays help information.';

  @override
  String? get help => 'Displays help information.';

  @override
  String? get defaultValue => null;

  @override
  String? get valueHelp => null;

  @override
  FutureOr<String> run(ArgResults args) async {
    final buffer = StringBuffer();

    if (args.flag('verbose')) {
      for (final cmd in runner.commands) {
        buffer.write(_renderCommandVerbose(cmd));
      }
      return buffer.toString();
    }

    if (args.commandArg != null) {
      final cmd = runner.commands.firstWhere(
        (command) => command.name == args.commandArg,
        orElse: () {
          throw ArgumentException(
            'Input ${args.commandArg} is not a known command.',
          );
        },
      );

      return _renderCommandVerbose(cmd);
    }

    for (final command in runner.commands) {
      buffer.writeln(command.usage);
    }

    return buffer.toString();
  }

  String _renderCommandVerbose(Command cmd) {
    final indent = ' ' * 10;
    final buffer = StringBuffer();

    buffer.writeln(cmd.usage.instructionText);
    buffer.writeln('$indent ${cmd.help}');

    if (cmd.valueHelp != null) {
      buffer.writeln(
        '$indent [Argument] Required? ${cmd.requiresArgument}, '
        'Type: ${cmd.valueHelp}, '
        'Default: ${cmd.defaultValue ?? 'none'}',
      );
    }

    buffer.writeln('$indent Options:');

    for (final option in cmd.options) {
      buffer.writeln('$indent ${option.usage}');
    }

    return buffer.toString();
  }
}
