/*-------------------------------------------------------------------------------

Informacoes:

O arquivo arguments.dart faz parte do pacote command_runner.

Este arquivo define a hierarquia de argumentos, opcoes, comandos e resultados para a analise de dados na nossa interface de linha de comando (CLI).

arguments.dart - Localizado em /dartpedia/command_runner/lib/src/arguments.dart

Outras informacoes importantes sobre o pacote:

site : 

Autor : Maria Eduarda Goncalves da silva <mariaflaviasilvasilva@gmail.com>

Manutencao : 

---------------------------------------------------------------------------------

Funcionamento:

Inicialmente o command_runner, ao ser executado, serve como a biblioteca principal que vai gerenciar e estruturar as regras de POO do nosso interpretador. 

Este arquivo especifico cria as pecas estruturais de argumentos, opcoes e comandos.

Dentro da pasta dartpedia em dartpedia/command_runner rode o comando dart analyze; o analisador do Dartdeve verificar o arquivo arguments.dart e validar que a estrutura de classes nao possui erros de sintaxe ou de compilacao.

Obs. Importante ! Este aplicativo esta em desenvolvimento e ao longo do tempo o comportamento do aplicativo pode mudar. Este arquivo depende das bibliotecas nativas 'dart:async' e 'dart:collection', alem dovinculo com o arquivo 'command_runner.dart'. 

-------------------------------------------------------------------------------

Dicionario do Versionamento:

v = versao

0 = Inicio do versionamento

. = Implementacao de versionamento

1 = Proxima versao, 2, proxima versao, e assim por diante.

-------------------------------------------------------------------------------

Historico de Versionamento:

-------------------------------------------------------------------------------

Versao: 0.0.0

Data: 19/05/2026

Descricao do codigo: Inicio do arquivo vazio para preparacao da estrutura.
Defina a hierarquia de argumentos

1. Primeiro, você definirá uma Argument classe, uma Option classe e uma Command classe, estabelecendo uma relação de herança.

Crie o arquivo command_runner/lib/src/arguments.dart. Este arquivo conterá as definições para suas classes Argument, Option, Command, e .ArgResults

Codigo: // Arquivo arguments.dart inicializado.

------------------------------------------------------------------------------

Versao: 0.0.1

Data: 19/05/2026

Descricao do codigo: Defina um enum chamado OptionType. 

command_runner/lib/src/arguments.dart  

enum OptionType { flag, option }

Isso enum representa o tipo de opção, que pode ser um `Enum` flag (uma opção booleana) ou um `Enum` option (uma opção que aceita um valor). Enums são úteis para representar um conjunto fixo de valores possíveis. 

Codigo: 

enum OptionType { flag, option } 

Saida padrao ao executar o codigo:

Comando: dart analyze

Saida: Analyzing command_runner...
No issues found!

------------------------------------------------------------------------------

Versao: 0.0.2

Data: 19/05/2026

Descricao do codigo: Defina um abstract class chamado Argument.

Comece definindo a estrutura básica da sua Argument classe. Você a declarará como `BaseClass` abstract, o que significa que ela serve como uma classe base que outras classes podem estender, mas não pode ser instanciada. por conta própria.

Abaixo do texto enum que você acabou de adicionar, cole o seguinte código:

command_runner/lib/src/arguments.dart
// Paste this new class below the enum you added
abstract class Argument {
  String get name;
  String? get help;

  // In the case of flags, the default value is a bool.
  // In other options and commands, the default value is a String.
  // NB: flags are just Option objects that don't take arguments
  Object? get defaultValue;
  String? get valueHelp;

  String get usage;
}
name é algo String que identifica o argumento de forma única.
help é um campo opcional String que fornece uma descrição.
defaultValue é do tipo Object? porque pode ser um bool (para bandeiras) ou um String.
valueHelp É um parâmetro opcional String para dar uma dica sobre o valor esperado.
O pegador usage fornecerá uma string mostrando como usar o argumento.

Com a Argument classe totalmente definida, você tem uma interface comum para todos os tipos de argumentos de linha de comando. Em seguida, você irá expandir isso definindo Option, um tipo específico de argumento que estende Argument.

Codigo: 

enum OptionType { flag, option }

abstract class Argument {
  String get name;
  String? get help;
  Object? get defaultValue;
  String? get valueHelp;


  String get usage;
}

Saida padrao ao executar o codigo:

Comando: dart analyze

Saida: Analyzing command_runner... No issues found!

-------------------------------------------------------------------------------

Versao: 0.0.3

Data: 19/05/2026

Descricao do codigo: Defina uma classe chamada Option essa extends Argument.

A Option classe representará opções de linha de comando como `--help` --verbose ou `--help` --output=file.txt. Ela herdará da sua Argument classe.

Adicione a seguinte Option classe ao final do seu arquivo:

command_runner/lib/src/arguments.dart

class Option extends Argument {
  Option(
    this.name, {
    required this.type,
    this.help,
    this.abbr,
    this.defaultValue,
    this.valueHelp,
  });

  @override
  final String name;

  final OptionType type;

  @override
  final String? help;

  final String? abbr;

  @override
  final Object? defaultValue;

  @override
  final String? valueHelp;

  @override
  String get usage {
    if (abbr != null) {
      return '-$abbr,--$name: $help';
    }

    return '--$name: $help';
  }
}

A extends palavra-chave estabelece a relação de herança. A classe usa a @override anotação em suas propriedades e getters para indicar que está substituindo os membros de espaço reservado definidos em Argument.

Também adiciona type (usando o OptionType enum) um método opcional abbr para uma forma abreviada da opção. O usage getter é implementado para fornecer instruções claras ao usuário.

Com o Option argumento `complete`, você tem um tipo especializado de argumento. Em seguida, você definirá a Command classe, outro tipo de argumento que representará as principais ações que um usuário pode executar em seu aplicativo de linha de comando (CLI).

Codigo : 

enum OptionType { flag, option }

abstract class Argument {
  String get name;
  String? get help;


  Object? get defaultValue;
  String? get valueHelp;

  String get usage;
}

class Option extends Argument {
  Option(
    this.name, {
    required this.type,
    this.help,
    this.abbr,
    this.defaultValue,
    this.valueHelp,
});


  @override
  final String name;
 
  final OptionType type;

  @override
  final String? help;
  
  final String? abbr;
  
  @override
  final Object? defaultValue;

  @override 
  final String? valueHelp;

  @override
  String get usage {
    if (abbr != null) { 
      return '-$abbr,--$name: $help';
    }

    return '--$name: $help';
  }
}

Saida padrao ao executar o codigo:

Comando: dart analyze

Saida: Analyzing command_runner... No issues found! 

-------------------------------------------------------------------------------

Versao: 0.0.4

Data: 19/05/2026

Descricao do codigo: Defina um abstract class chamado Command que também extends Argument.

A Commandclasse representará uma ação executável. Como ela fornece um modelo para outros comandos seguirem, você a declarará como abstract.

command_runner/lib/src/arguments.dart

// Add this class below the Option class
abstract class Command extends Argument {
  // Properties and methods will go here
}

A abstract palavra-chave significa que Command não pode ser instanciada diretamente. Ela serve como classe base para outras classes. 

Agora, adicione as propriedades principais. Um comando precisa de um `a` name e um `b` description . Ele também precisa de uma referência ao ` CommandRunner c` que o executa.

command_runner/lib/src/arguments.dart

bstract class Command extends Argument {
  @override
  String get name;

  String get description;

  bool get requiresArgument => false;

  late CommandRunner runner;

  @override
  String? help;

  @override
  String? defaultValue;

  @override
  String? valueHelp;
}

A runnerpropriedade é do tipo CommandRunner, que você definirá posteriormente em command_runner_base.dart.

Observe a late palavra-chave. Ela indica ao Dart que você promete inicializar essa variável antes mesmo de ela ser acessada, permitindo que você declare uma variável não nula sem precisar atribuí-la imediatamente. Isso é útil quando a inicialização de uma variável depende de outros objetos (como um comando sendo adicionado a um executor).

Para que o Dart reconheça esta classe, você deve importar o arquivo que a define. Adicione a seguinte importação ao início do arquivo command_runner/lib/src/arguments.dart:

import '../command_runner.dart';

Em seguida, você atribuirá aos comandos seus próprios conjuntos de opções. Para evitar que outras partes do seu código modifiquem essas opções inesperadamente, você as armazenará em uma variável privada.
list ( _options). Em Dart, prefixar um nome de variável ou campo com um sublinhado ( _) torna-o privado da biblioteca.

Em vez de permitir o acesso direto, você expõe as opções por meio de uma visualização somente leitura e não modificável ( UnmodifiableSetView). Essa abordagem é uma parte fundamental do encapsulamento: a prática de restringir o acesso direto ao estado interno de uma classe para evitar interferências não intencionais.

A UnmodifiableSetViewclasse faz parte da biblioteca de coleções principal do Dart. Para usá-la, você precisa importar essa biblioteca.

Atualize as importações no início do seu arquivo para incluir dart:collection:

import 'dart:collection'; // New import
import '../command_runner.dart';

Agora, adicione a optionslista e o getter à sua Commandclasse:

abstract class Command extends Argument {
  // ... existing properties ...

  @override
  String? valueHelp;


  // Add the following lines to the bottom of your Command class:

  final List<Option> _options = [];

  UnmodifiableSetView<Option> get options =>
      UnmodifiableSetView(_options.toSet());
}

Como _options`options` é privado, o código externo não pode adicionar opções diretamente. Para permitir que os comandos definam suas opções, você fornecerá dois métodos auxiliares internos: `addOptions` addFlage `addOptions` addOption. Esses métodos instanciarão os Optionobjetos apropriados e os adicionarão à lista privada.

abstract class Command extends Argument {
  // ... existing properties and getters ...

  UnmodifiableSetView<Option> get options =>
      UnmodifiableSetView(_options.toSet());


  // Add the following lines to the bottom of your Command class:

  // A flag is an [Option] that's treated as a boolean.
  void addFlag(String name, {String? help, String? abbr, String? valueHelp}) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: false,
        valueHelp: valueHelp,
        type: OptionType.flag,
      ),
    );
  }

  // An option is an [Option] that takes a value.
  void addOption(
    String name, {
    String? help,
    String? abbr,
    String? defaultValue,
    String? valueHelp,
  }) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: defaultValue,
        valueHelp: valueHelp,
        type: OptionType.option,
      ),
    );
  }
}

Por fim, cada comando deve ter uma lógica para ser executada quando chamado. Você definirá um runmétodo abstrato que os comandos concretos devem implementar.

Como um comando pode ser síncrono ou assíncrono, seu run método retorna o FutureOr tipo de dart:async, permitindo que ele retorne um valor bruto ou um Future. Esta é a sua última importação obrigatória.

Atualize as importações no início do seu arquivo para incluir dart:async:

import 'dart:async'; // New import
import 'dart:collection';
import '../command_runner.dart';

Agora você pode adicionar o runmétodo abstrato e fornecer a usageimplementação para completar a Command classe.

abstract class Command extends Argument {
  // ... existing properties, getters, and methods ...

  void addOption(
    String name, {
    String? help,
    String? abbr,
    String? defaultValue,
    String? valueHelp,
  }) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: defaultValue,
        valueHelp: valueHelp,
        type: OptionType.option,
      ),
    );
  }


  // Add the following lines to the bottom of your Command class:
  FutureOr<Object?> run(ArgResults args);

  @override
  String get usage {
    return '$name:  $description';
  }
}

run(ArgResults args)Este método abstrato é onde reside a lógica de um comando. As subclasses concretas devem implementá-lo.
usageEste getter fornece uma string de uso simples, combinando o comando namee description.
A Commandclasse agora fornece uma base sólida para todos os comandos em seu aplicativo CLI. Com a hierarquia de classes implementada, você está pronto para definir ArgResultso armazenamento da entrada analisada.

Codigo : 

import 'dart:async'; 
import 'dart:collection';
import '../command_runner.dart';

enum OptionType { flag, option }

abstract class Argument {
  String get name;
  String? get help;

  Object? get defaultValue;
  String? get valueHelp;

  String get usage;
}

class Option extends Argument {
  Option(
     this.name, {
     required this.type,
     this.help,
     this.abbr, 
     this.defaultValue,
     this.valueHelp,
});

  @override
  final String name;
 
  final OptionType type;

  @override
  final String? help;

  final String? abbr;

  @override
  final Object? defaultValue;
 
  @override
  final String? valueHelp;

  @override
  String get usage {
    if (abbr != null){ 
      return '-$abbr,--$name: $help';


      return '--$name: $help';
  }
}


abstract class Command extends Argument {
  @override
  String get name;

  String get description;

  bool get requiresArgument => false;

  late CommandRunner runner;

  @override
  String? help;

  @override
  String? defaultValue;

  @override
  String? valueHelp;
  
  final List<Option> _options = [];

  UnmodifiableSetView<Option> get options =>
      UnmodifiableSetView(_options.toSet());

  void addFlag(String name, {String? help, String? abbr, String? valueHelp}) {
    _options.add(
      Option(
      name,
      help: help,
      abbr: abbr,
      defaultValue: false,
      valueHelp: valueHelp,
      type: OptionType.flag
     ),
   );
  }



  void addOption(
    String name, {
    String? help,
    String? abbr,
    String? defaultValue,
    String? valueHelp,
}) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: defaultValue,
        valueHelp: valueHelp,
        type: OptionType.option,
      ),
    );
  }
}

Saida padrao ao executar o codigo:

Comando: dart analyze

Saida: Analyzing command_runner... 
No issues found!

-------------------------------------------------------------------------------

Versao: 0.0.5

Data: 19/05/2026

Descricao do codigo: Defina uma classe chamada ArgResults.

command_runner/lib/src/arguments.dart

// Add this class to the end of the file
class ArgResults {
  Command? command;
  String? commandArg;
  Map<Option, Object?> options = {};

  // Returns true if the flag exists.
  bool flag(String name) {
    // Only check flags, because we're sure that flags are booleans.
    for (var option in options.keys.where(
      (option) => option.type == OptionType.flag,
    )) {
      if (option.name == name) {
        return options[option] as bool;
      }
    }
    return false;
  }

  bool hasOption(String name) {
    return options.keys.any((option) => option.name == name);
  }

  ({Option option, Object? input}) getOption(String name) {
    var mapEntry = options.entries.firstWhere(
      (entry) => entry.key.name == name || entry.key.abbr == name,
    );

    return (option: mapEntry.key, input: mapEntry.value);
  }
}

Esta classe representa os resultados da análise dos argumentos da linha de comando. Ela contém o comando detectado, quaisquer argumentos para esse comando e um mapa das opções especificadas.

O flag() método: Itera sobre as chaves do options mapa, filtrando aquelas onde type é OptionType.flag. Ele usa conversão de tipo explícita ( as bool) porque sabemos que os flags são valores booleanos.

Tipos de registro: O getOption método retorna um tipo de registro (option: ..., input: ...), que permite agrupar vários valores sem criar uma classe completa.

Agora você definiu a estrutura básica para lidar com comandos, argumentos e opções em seu aplicativo de linha de comando.

Codigo:

import 'dart:async';
import 'dart:collection';
import '../command_runner.dart';

enum OptionType { flag, option }

abstract class Argument {
  String get name;
  String? get help;

  Object? get defaultValue;
  String? get valueHelp;

  String get usage;
}

class Option extends Argument {
  Option(
    this.name, {
    required this.type,
    this.help,
    this.abbr,
    this.defaultValue,
    this.valueHelp,
  });

  @override
  final String name;

  final OptionType type;

  @override
  final String? help;

  final String? abbr;

  @override
  final Object? defaultValue;

  @override
  final String? valueHelp;

  @override
  String get usage {
    if (abbr != null) {
      return '-$abbr,--$name: $help';
    }

    return '--$name: $help';
  }
}

abstract class Command extends Argument {
  @override
  String get name;

  String get description;

  bool get requiresArgument => false;

  late CommandRunner runner;

  @override
  String? help;

  @override
  String? defaultValue;

  @override
  String? valueHelp;

final List<Option> _options = [];

  UnmodifiableSetView<Option> get options =>
      UnmodifiableSetView(_options.toSet());

  // A flag is an [Option] that's treated as a boolean.
  void addFlag(String name, {String? help, String? abbr, String? valueHelp}) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: false,
        valueHelp: valueHelp,
        type: OptionType.flag,
      ),
    );
  }

  // An option is an [Option] that takes a value.
  void addOption(
    String name, {
    String? help,
    String? abbr,
    String? defaultValue,
    String? valueHelp,
  }) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: defaultValue,
        valueHelp: valueHelp,
        type: OptionType.option,
      ),
    );
  }

  FutureOr<Object?> run(ArgResults args);

  @override
  String get usage {
    return '$name:  $description';
  }
}

class ArgResults {
  Command? command;
  String? commandArg;
  Map<Option, Object?> options = {};

  // Returns true if the flag exists.
  bool flag(String name) {
    // Only check flags, because we're sure that flags are booleans.
    for (var option in options.keys.where(
      (option) => option.type == OptionType.flag,
    )) {
      if (option.name == name) {
        return options[option] as bool;
      }
    }

    return false;
  }

  bool hasOption(String name) {
    return options.keys.any((option) => option.name == name);
  }

  ({Option option, Object? input}) getOption(String name) {
    var mapEntry = options.entries.firstWhere(
      (entry) => entry.key.name == name || entry.key.abbr == name,
    );

    return (option: mapEntry.key, input: mapEntry.value);
  }
}

Saida padrao ao executar o codigo:

Comando: dart analyze

Saida: Analyzing command_runner...
No issues found!

-------------------------------------------------------------------------------
*/
//Codigo ate aqui: 

//Codigo:

import 'dart:async';
import 'dart:collection';
import '../command_runner.dart';

enum OptionType { flag, option }

abstract class Argument {
  String get name;
  String? get help;

  Object? get defaultValue;
  String? get valueHelp;

  String get usage;
}

class Option extends Argument {
  Option(
    this.name, {
    required this.type,
    this.help,
    this.abbr,
    this.defaultValue,
    this.valueHelp,
  });

  @override
  final String name;

  final OptionType type;

  @override
  final String? help;

  final String? abbr;

  @override
  final Object? defaultValue;

  @override
  final String? valueHelp;

  @override
  String get usage {
    if (abbr != null) {
      return '-$abbr,--$name: $help';
    }

    return '--$name: $help';
  }
}

abstract class Command extends Argument {
  @override
  String get name;

  String get description;

  bool get requiresArgument => false;

  late CommandRunner runner;

  @override
  String? help;

  @override
  String? defaultValue;

  @override
  String? valueHelp;

  final List<Option> _options = [];

  UnmodifiableSetView<Option> get options =>
      UnmodifiableSetView(_options.toSet());

  // A flag is an [Option] that's treated as a boolean.
  void addFlag(String name, {String? help, String? abbr, String? valueHelp}) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: false,
        valueHelp: valueHelp,
        type: OptionType.flag,
      ),
    );
  }

  // An option is an [Option] that takes a value.
  void addOption(
    String name, {
    String? help,
    String? abbr,
    String? defaultValue,
    String? valueHelp,
  }) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: defaultValue,
        valueHelp: valueHelp,
        type: OptionType.option,
      ),
    );
  }

  FutureOr<Object?> run(ArgResults args);

  @override
  String get usage {
    return '$name:  $description';
  }
}

class ArgResults {
  Command? command;
  String? commandArg;
  Map<Option, Object?> options = {};

  // Returns true if the flag exists.
  bool flag(String name) {
    // Only check flags, because we're sure that flags are booleans.
    for (var option in options.keys.where(
      (option) => option.type == OptionType.flag,
    )) {
      if (option.name == name) {
        return options[option] as bool;
      }
    }

    return false;
  }

  bool hasOption(String name) {
    return options.keys.any((option) => option.name == name);
  }

  ({Option option, Object? input}) getOption(String name) {
    var mapEntry = options.entries.firstWhere(
      (entry) => entry.key.name == name || entry.key.abbr == name,
    );

    return (option: mapEntry.key, input: mapEntry.value);
  }
} 
