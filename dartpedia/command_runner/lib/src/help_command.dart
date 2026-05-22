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
*/
//Codigo ate aqui:

//Codigo:

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
