/*-----------------------------------------------------------------------------

Informacoes:

Este arquivo contem a implementacao real (a logica) do pacote command_runner.

command_runner_base.dart - Localizado em /dartpedia/command_runner/lib/src/

Outras informacoes importantes sobre o pacote:

site            :

E-mail                    : Juliana Zerbinatti Sendon Garrido <julianazerbinatti73@gmail.com>

Manutencao      :

-------------------------------------------------------------------------------

Funcionamento:

Define a classe CommandRunner e o metodo run(), que e responsavel por receber e processar os comandos enviados pelo aplicativo cli.

Obs. Importante ! Este motor eh simplificado por enquanto; a analise de comandos complexos sera integrada aqui em capitulos posteriores.

-------------------------------------------------------------------------------

Dicionario do versionamento:

v = versao

0 = Inicio do versionamento

. = Implementacao de versionamento

1 = Proxima versao, 2, proxima versao, e assim por diante.

-------------------------------------------------------------------------------

Historico de Versionamento:

-------------------------------------------------------------------------------

Versao: 0.0.0

Data:11/05/2026

Descricao do codigo: Codigo original do pacote

Codigo:

// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
//class Awesome {    //Ativo      
//  bool get isAwesome => true;    //Ativo
//}   //Ativo

-------------------------------------------------------------------------------

Versao: 0.0.1

Data:11/05/2026

Descricao do codigo: Remova qualquer código de espaço reservado existente e adicione a seguinte CommandRunner classe a command_runner/lib/src/command_runner_base.dart:

class CommandRunner {
 Runs the command-line application logic with the given arguments.
  Future<void> run(List<String> input) async {
  print('CommandRunner received arguments: $input');
  }
}
  Principais trechos do código anterior:

CommandRunner é uma classe que serve como substituta simplificada por enquanto. Seu runmétodo atualmente apenas imprime os argumentos recebidos. Em capítulos posteriores, você expandirá essa classe para lidar com a análise de comandos complexos e configuráveis.
Future<void> é um tipo de retorno que indica que este método pode executar operações assíncronas, mas não retorna um valor.

Codigo:

  class CommandRunner {
      Runs the command-line application logic with the given arguments.
    Future<void> run(List<String> input) async {print('CommandRunner received arguments: $input');
  }
}  

-------------------------------------------------------------------------------

Versao: 0.0.2

Data : 19/05/2026

Descricao do codigo : Atualizar a classe CommandRunner

Substitua a CommandRunner classe existente pela seguinte:

command_runner/lib/src/command_runner_base.dart

import 'dart:collection';
import 'dart:io';
import 'arguments.dart';

class CommandRunner {
  final Map<String, Command> _commands = <String, Command>{};

 UnmodifiableSetView<Command> get commands =>
      UnmodifiableSetView<Command>(<Command>{..._commands.values});

  Future<void> run(List<String> input) async {
  final ArgResults results = parse(input);
    if (results.command != null) {
       Object? output = await results.command!.run(results);
      print(output.toString());
    }
  }

    void addCommand(Command command) {
       TODO: handle error (Commands can't have names that conflict)
     _commands[command.name] = command;
     command.runner = this;
  }

   ArgResults parse(List<String> input) {
    var results = ArgResults();
    results.command = _commands[input.first];
    return results;
  }

  // Returns usage for the executable only.
  // Should be overridden if you aren't using [HelpCommand]
  // or another means of printing usage.

  String get usage {
   final exeFile = Platform.script.path.split('/').last;
   return 'Usage: dart bin/$exeFile <command> [commandArg?] [...options?]';
    }
 }

Esta classe atualizada incorpora sua nova estrutura orientada a objetos. Ela usa o operador de propagação (spread operator ...)no commands getter para desempacotar os valores do _commands mapa em um novo conjunto. Isso garante que o valor de retorno seja uma cópia, impedindo que código externo modifique seus dados.

No run() método, results.command!.run(...) usa-se o operador de asserção não nulo ( !) para dizer ao analisador Dart que você tem certeza results.command de que não é nulo. É seguro aqui porque você acabou de verificar se não era nulo na if instrução anterior.

Aqui estão os principais detalhes de implementação:

°_commands mapa: Um mapa privado que associa nomes de comandos às suas Command instâncias de objetos concretos. Seus valores sao expostos por meio de um UnmodifiableSetView. °addCommand() Registra um comando e atribui this o executor à runner propriedadedo comando. Isso cumpre a late promessa de inicialização feita anteriormente na Command classe.

°parse() e run(): Avalia a entrada do usuário, identifica o correspondente Command no mapa e usa await para chamar o método do comando run().

Codigo:

import 'dart:collection';
import 'dart:io';
import 'arguments.dart';

class CommandRunner {
  final Map<String, Command> _commands = <String, Command>{};

  UnmodifiableSetView<Command> get commands =>
      UnmodifiableSetView<Command>(<Command>{..._commands.values});

  Future<void> run(List<String> input) async {
    final ArgResults results = parse(input);
    if (results.command != null) {
      Object? output = await results.command!.run(results);
      print(output.toString());
    }
  }

  void addCommand(Command command) {
    // TODO: handle error (Commands can't have names that conflict)
    _commands[command.name] = command;
    command.runner = this;
  }

  ArgResults parse(List<String> input) {
    var results = ArgResults();
    results.command = _commands[input.first];
    return results;
  }

  // Returns usage for the executable only.
  // Should be overridden if you aren't using [HelpCommand]
  // or another means of printing usage.

  String get usage {
    final exeFile = Platform.script.path.split('/').last;
    return 'Usage: dart bin/$exeFile <command> [commandArg?] [...options?]';
  }
}

-------------------------------------------------------------------------------
*/
//Codigo ate aqui : 

//Codigo: 

import 'dart:collection';
import 'dart:io';
import 'arguments.dart';

class CommandRunner {
  final Map<String, Command> _commands = <String, Command>{};

  UnmodifiableSetView<Command> get commands =>
      UnmodifiableSetView<Command>(<Command>{..._commands.values});

  Future<void> run(List<String> input) async {
    final ArgResults results = parse(input);

    if (results.command != null) {
      Object? output = await results.command!.run(results);
      print(output.toString());
    }
  }

  void addCommand(Command command) {
    // TODO: handle error (Commands can't have names that conflict)
    _commands[command.name] = command;
    command.runner = this;
  }

  ArgResults parse(List<String> input) {
    var results = ArgResults();
    results.command = _commands[input.first];
    return results;
  }

  // Returns usage for the executable only.
  // Should be overridden if you aren't using [HelpCommand]
  // or another means of printing usage.

  String get usage {
    final exeFile = Platform.script.path.split('/').last;

    return 'Usage: dart bin/$exeFile <command> [commandArg?] [...options?]';
  }
} 
