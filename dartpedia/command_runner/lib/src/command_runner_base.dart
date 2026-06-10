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

Versao: 0.0.3

Data: 28/05/2026

Descricao do codigo:  Implementar o tratamento de erros no CommandRunner

Em seguida, atualize a CommandRunner classe para lidar com possíveis erros de forma adequada. Isso envolve adicionar uma função de retorno de chamada para tratamento de erros, usar o `try-catch` try/catch para gerenciar exceções e lançar a nova exceção ArgumentException quando o usuário fornecer uma entrada inválida.

1. Adicione as importações necessárias.

Em command_runner/lib/src/command_runner_base.dart, adicione as importações para dart:async (para usar FutureOr) e seu novo exceptions.dart arquivo.

2. Adicione uma onErrorfunção de retorno (callback) ao CommandRunner.

Modifique o CommandRunner para aceitar uma onError função opcional em seu construtor. Isso permitirá que o usuário do seu pacote defina sua própria lógica de tratamento de erros.

class CommandRunner {
  // Add a constructor that accepts the optional callback.
  CommandRunner({this.onError});

  final Map<String, Command> _commands = <String, Command>{};

  UnmodifiableSetView<Command> get commands =>
      UnmodifiableSetView<Command>(<Command>{..._commands.values});

  // Define the onError property.
  FutureOr<void> Function(Object)? onError;

  // The rest of the class implementation...
}

Essa alteração introduz uma onError propriedade anulável. O FutureOr<void> Function(Object)? tipo significa que é uma função que recebe um valor Object e retorna um Future valor ou nada, podendo ser nulo.

3. Atualize o método de execução para usar try/ catch.

Envolva a lógica dentro do método `run` em um bloco try`/ catch`. Se ocorrer uma exceção, este bloco irá "capturá-la" e passá-la para a onError função de retorno de chamada (callback) ou relançá-la caso nenhuma função de retorno de chamada tenha sido fornecida. Isso rethrow preserva o erro original e o rastreamento da pilha de erros. 

Future<void> run(List<String> input) async {
  // [Step 6 update] try/catch added
  try {
    final ArgResults results = parse(input);
    if (results.command != null) {
      Object? output = await results.command!.run(results);
      print(output.toString());
    }
  } on Exception catch (exception) {
    if (onError != null) {
      onError!(exception);
    } else {
      rethrow;
    }
  }
}

4. Adicione validação ao parse método. 

Por fim, substitua o parse método existente pela command_runner_base.dart seguinte versãoatualizada. Esta nova versão é muito mais robusta. Ela está repleta de verificações que lançarão uma exceção personalizada ArgumentException sempre que detectarem uma entrada inválida do usuário.

// [Step 6 update] This method is replaced entirely.
ArgResults parse(List<String> input) {
  ArgResults results = ArgResults();
  if (input.isEmpty) return results;

  // Throw an exception if the command is not recognized.
  if (_commands.containsKey(input.first)) {
    results.command = _commands[input.first];
    input = input.sublist(1);
  } else {
    throw ArgumentException(
      'The first word of input must be a command.',
      null,
      input.first,
    );
  }

  // Throw an exception if multiple commands are provided.
  if (results.command != null &&
      input.isNotEmpty &&
      _commands.containsKey(input.first)) {
    throw ArgumentException(
      'Input can only contain one command. Got ${input.first} and ${results.command!.name}',
      null,
      input.first,
    );
  }

  // Section: Handle options, including flags.
  Map<Option, Object?> inputOptions = {};
  int i = 0;
  while (i < input.length) {
    if (input[i].startsWith('-')) {
      var base = _removeDash(input[i]);
      // Throw an exception if an option is not recognized for the given command.
      var option = results.command!.options.firstWhere(
        (option) => option.name == base || option.abbr == base,
        orElse: () {
          throw ArgumentException(
            'Unknown option ${input[i]}',
            results.command!.name,
            input[i],
          );
        },
      );

      if (option.type == OptionType.flag) {
        inputOptions[option] = true;
        i++;
        continue;
      }

      if (option.type == OptionType.option) {
        // Throw an exception if an option requires an argument but none is given.
        if (i + 1 >= input.length) {
          throw ArgumentException(
            'Option ${option.name} requires an argument',
            results.command!.name,
            option.name,
          );
        }
        if (input[i + 1].startsWith('-')) {
          throw ArgumentException(
            'Option ${option.name} requires an argument, but got another option ${input[i + 1]}',
            results.command!.name,
            option.name,
          );
        }
        var arg = input[i + 1];
        inputOptions[option] = arg;
        i++;
      }
    } else {
      // Throw an exception if more than one positional argument is provided.
      if (results.commandArg != null && results.commandArg!.isNotEmpty) {
        throw ArgumentException(
          'Commands can only have up to one argument.',
          results.command!.name,
          input[i],
        );
      }
      results.commandArg = input[i];
    }
    i++;
  }
  results.options = inputOptions;

  return results;
}

String _removeDash(String input) {
  if (input.startsWith('--')) {
    return input.substring(2);
  }
  if (input.startsWith('-')) {
    return input.substring(1);
  }
  return input;
}

Este método de análise sintática atualizado agora se defende ativamente contra entradas inválidas. Especificamente, as novas instruções `throw` lidam com vários casos de erro comuns:

° Comandos desconhecidos: O primeiro bloco if/ else garante que o primeiro argumento seja um comando válido.
° Comandos múltiplos: Verifica se o usuário não tentou executar mais de um comando por vez.
° Opções desconhecidas: O orElse parâmetro firstWhere agora gera uma exceção se um usuário fornecer uma flag ou opção (como --foo) que não tenha sido definida para esse comando.
° Valores de opção ausentes: Garante que uma opção (como --output) seja seguida por um valor e não por outra opção ou pelo final da entrada.
° Argumentos em excesso: Impõe uma regra que limita os comandos a um único argumento posicional.

Codigo: 

import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'arguments.dart';
import 'exceptions.dart';

class CommandRunner {
  
  CommandRunner({this.onError});
  
  final Map<String, Command> _commands = <String, Command>{};

  UnmodifiableSetView<Command> get commands =>
      UnmodifiableSetView<Command>(<Command>{..._commands.values});
  
  FutureOr<void> Function(Object)? onError;
  
  Future<void> run(List<String> input) async {
    final ArgResults results = parse(input);
    if (results.command != null) {
      Object? output = await results.command!.run(results);
      print(output.toString());
    }
  } on Exception catch (exception) {
    if (onError != null) {
      onError!(exception);
    } else {
      rethrow;
    }
  }
}

  void addCommand(Command command) {
    // TODO: handle error (Commands can't have names that conflict)
    _commands[command.name] = command;
    command.runner = this;
  }

  ArgResults parse(List<String> input) {
    ArgResults results = ArgResults();
  if (input.isEmpty) return results;

  // Throw an exception if the command is not recognized.
  if (_commands.containsKey(input.first)) {
    results.command = _commands[input.first];
    input = input.sublist(1);
  } else {
    throw ArgumentException(
      'The first word of input must be a command.',
      null,
      input.first,
    );
  }

  // Throw an exception if multiple commands are provided.
  if (results.command != null &&
      input.isNotEmpty &&
      _commands.containsKey(input.first)) {
    throw ArgumentException(
      'Input can only contain one command. Got ${input.first} and ${results.command!.name}',
      null,
      input.first,
    );
  }

  // Section: Handle options, including flags.
  Map<Option, Object?> inputOptions = {};
  int i = 0;
  while (i < input.length) {
    if (input[i].startsWith('-')) {
      var base = _removeDash(input[i]);
      // Throw an exception if an option is not recognized for the given command.
      var option = results.command!.options.firstWhere(
        (option) => option.name == base || option.abbr == base,
        orElse: () {
          throw ArgumentException(
            'Unknown option ${input[i]}',
            results.command!.name,
            input[i],
          );
        },
      );

      if (option.type == OptionType.flag) {
        inputOptions[option] = true;
        i++;
        continue;
      }

      if (option.type == OptionType.option) {
        // Throw an exception if an option requires an argument but none is given.
        if (i + 1 >= input.length) {
          throw ArgumentException(
            'Option ${option.name} requires an argument',
            results.command!.name,
            option.name,
          );
        }
        if (input[i + 1].startsWith('-')) {
          throw ArgumentException(
            'Option ${option.name} requires an argument, but got another option ${input[i + 1]}',
            results.command!.name,
            option.name,
          );
        }
        var arg = input[i + 1];
        inputOptions[option] = arg;
        i++;
      }
    } else {
      // Throw an exception if more than one positional argument is provided.
      if (results.commandArg != null && results.commandArg!.isNotEmpty) {
        throw ArgumentException(
          'Commands can only have up to one argument.',
          results.command!.name,
          input[i],
        );
      }
      results.commandArg = input[i];
    }
    i++;
  }
  results.options = inputOptions;

  return results;
}

String _removeDash(String input) {
  if (input.startsWith('--')) {
    return input.substring(2);
  }
  if (input.startsWith('-')) {
    return input.substring(1);
  }
  return input;
}

-------------------------------------------------------------------------------
Versao: 0.0.4

Data: 09/06/2026

Descricao do codigo: Adicionar um onOutputretorno de chamada

Em seguida, adicione um onOutputargumento para CommandRunnerpermitir o tratamento flexível da saída.

Abra o command_runner/lib/src/command_runner_base.dartarquivo.

Adicione o onOutputargumento ao CommandRunnerconstrutor e o onOutputmembro correspondente à classe.

class CommandRunner {
  CommandRunner({this.onOutput, this.onError});

  /// If not null, this method is used to handle output. Useful if you want to
  /// execute code before the output is printed to the console, or if you
  /// want to do something other than print output the console.
  /// If null, the onInput method will [print] the output.
  FutureOr<void> Function(String)? onOutput;

  FutureOr<void> Function(Object)? onError;

  // ... rest of the class
}

Atualize o runmétodo para usar o onOutputargumento.

  Future<void> run(List<String> input) async {
    try {
      final ArgResults results = parse(input);
      if (results.command != null) {
        Object? output = await results.command!.run(results);
        if (onOutput != null) {
          await onOutput!(output.toString());
        } else {
          print(output.toString());
        }
      }
    } on Exception catch (exception) {
      if (onError != null) {
        onError!(exception);
      } else {
        rethrow;
      }
    }
  }
Isso atualiza o runmétodo para usar a onOutputfunção se ela for fornecida; caso contrário, o padrão é imprimir no console. 


Codigo : 

class CommandRunner {
  CommandRunner({this.onOutput, this.onError});

  /// If not null, this method is used to handle output. Useful if you want to
  /// execute code before the output is printed to the console, or if you
  /// want to do something other than print output the console.
  /// If null, the onInput method will [print] the output.
  FutureOr<void> Function(String)? onOutput;

  FutureOr<void> Function(Object)? onError;

  // ... rest of the class
}

//Update the run method to use the onOutput argument.  


  Future<void> run(List<String> input) async {
    try {
      final ArgResults results = parse(input);
      if (results.command != null) {
        Object? output = await results.command!.run(results);
        if (onOutput != null) {
          await onOutput!(output.toString());
        } else {
          print(output.toString());
        }
      }
    } on Exception catch (exception) {
      if (onError != null) {
        onError!(exception);
      } else {
        rethrow;
      }
    }
  }
-------------------------------------------------------------------------------

Codigo ate aqui : 
*/

class CommandRunner {
  CommandRunner({this.onOutput, this.onError});

  /// If not null, this method is used to handle output. Useful if you want to
  /// execute code before the output is printed to the console, or if you
  /// want to do something other than print output the console.
  /// If null, the onInput method will [print] the output.
  FutureOr<void> Function(String)? onOutput;

  FutureOr<void> Function(Object)? onError;

  // ... rest of the class
}

//Update the run method to use the onOutput argument.  


  Future<void> run(List<String> input) async {
    try {
      final ArgResults results = parse(input);
      if (results.command != null) {
        Object? output = await results.command!.run(results);
        if (onOutput != null) {
          await onOutput!(output.toString());
        } else {
          print(output.toString());
        }
      }
    } on Exception catch (exception) {
      if (onError != null) {
        onError!(exception);
      } else {
        rethrow;
      }
    }
  }  
