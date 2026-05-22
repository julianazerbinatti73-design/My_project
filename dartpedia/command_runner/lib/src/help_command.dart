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

O comando `HelpCommand`, ao ser executado, exibe informações de uso da aplicação e dos comandos registrados no `CommandRunner`.

Exemplo de execução:

Dentro da pasta do projeto `dartpedia/command_runner`, execute o seguinte comando:

dart analyze

Saída esperada:

Analyzing command_runner...
No issues found!

-------------------------------------------------------------------------------

Observação

A classe `HelpCommand` demonstra o uso de herança em Dart, utilizando recursos da classe `Command` para adicionar opções, sobrescrever o método `run()` e acessar o estado `runner` para gerar mensagens de ajuda e uso da aplicação.


-------------------------------------------------------------------------------

Historico

-------------------------------------------------------------------------------

Versao: 0.0.0
Data: 21/05/2026
Descricao do codigo: Criar um comando de ajuda

Crie um HelpCommand objeto que estenda a Commandclasse e imprima informações de uso.

Crie o arquivo command_runner/lib/src/help_command.dart.

-------------------------------------------------------------------------------

Codigo: // Arquivo help_command.dart inicializado.

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

Código:

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

--------------------------

Codigo ate aqui:

Codigo:
*/

import 'dart:async';

import 'arguments.dart';

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
  FutureOr<Object?> run(ArgResults args) async {
    var usageText = runner.usage;

    for (var command in runner.commands) {
      usageText += '\n${command.name}';
    }

    return usageText;
  }
}
