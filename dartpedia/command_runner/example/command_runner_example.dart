<<<<<<< HEAD
/*
Versão 0.0.0

Data: 03/06/2026

Descrição do codigo: codigo original
=======
/*-----------------------------------------------------------------------------

Informacoes:

O arquivo command_runner_example.dart faz parte do pacote command_runner.

Este arquivo serve como um exemplo pratico de utilizacao do pacote, criando
o comando 'PrettyEcho' para demonstrar a impressao de textos coloridos na CLI.

command_runner_example.dart - Localizado em /dartpedia/command_runner/example/command_runner_example.dart

Outras informacoes importantes sobre o pacote:

site            :

Autor           : Julia Souza Zampieri <julia.zampieri@edu.senai.br>

Manutencao      :

-------------------------------------------------------------------------------

Funcionamento:

Inicialmente o command_runner, ao ser executado, serve como a biblioteca principal que vai gerenciar e estruturar as regras de POO do nosso interpretador. 

Este arquivo de exemplo roda a funcao main, inicializa o CommandRunner e executa o comando de eco colorido (PrettyEcho) diretamente por argumentos do terminal.

Dentro da pasta dartpedia em dartpedia/command_runner rode o comando dart run example/command_runner_example.dart echo "hello world goodbye"; ele deve processar o texto e exibi-lo formatado com cores ANSI no console.

Obs. Importante ! Este aplicativo esta em desenvolvimento e ao longo do tempo o comportamento do aplicativo pode mudar.

Este arquivo depende da biblioteca nativa 'dart:async' e importa diretamente o pacote 'package:command_runner/command_runner.dart'.

-------------------------------------------------------------------------------

Dicionario do versionamento:

v = versao
0 = Inicio do versionamento
. = Implementacao de versionamento
1 = Proxima versao, 2, proxima versao, e assim por diante.

-------------------------------------------------------------------------------

Historico de versionamento:

-------------------------------------------------------------------------------

Versao: 0.0.0

Data: 04/06/2026

Descricao do codigo: Codigo original do arquivo
>>>>>>> 8c5a50384b37d4c79ee84647f5af22852992b18f

Codigo:

import 'package:command_runner/command_runner.dart';

void main() {
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');
}

<<<<<<< HEAD
-------------------------------------------------------------------------------

Versão 0.0.1

Data: 03/06/2026

Descrição do codigo: Implementar o comando de eco colorido
#
Por fim, implemente um comando de exemplo para testar a impressão. É uma boa prática implementar exemplos de uso de um pacote em Dart para desenvolvedores que usarão seu pacote. Este exemplo cria um comando que torna a saída do console colorida.

Abra o example/command_runner_example.dartarquivo.
=======
Saida padrao ao executar o codigo: Desconhecida

Comando: 

Saida:

-------------------------------------------------------------------------------

Versao: 0.0.1

Data: 04/06/2026

Descricao do codigo:  Implementar o comando de eco colorido

Por fim, implemente um comando de exemplo para testar a impressão. É uma boa prática implementar exemplos de uso de um pacote em Dart para desenvolvedores que usarão seu pacote. Este exemplo cria um comando que torna a saída do console colorida.

1. Abra o example/command_runner_example.dart arquivo.

2. Substitua o conteúdo do arquivo pelo seguinte código:

command_runner/example/command_runner_example.dart

>>>>>>> 8c5a50384b37d4c79ee84647f5af22852992b18f
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

<<<<<<< HEAD
Codigo:

*/

=======
Este código define um PrettyEcho comando que estende a Command classe. Ele recebe uma string como argumento e aplica cores diferentes a cada palavra com base em sua posição na string. O run método utiliza os métodos getter titleText`color` instructionText, `color` e `color` errorText da TextRenderUtils extensão para aplicar as cores.

Codigo: 

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

Saida padrao ao executar o codigo:

Comando: dart run example/command_runner_example.dart echo "hello world goodbye" //echo: voce insere sua mensagem.

Saida: hello world goodbye 

-------------------------------------------------------------------------------
*/

// Codigo ate aqui: 

// Codigo: 

>>>>>>> 8c5a50384b37d4c79ee84647f5af22852992b18f
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

