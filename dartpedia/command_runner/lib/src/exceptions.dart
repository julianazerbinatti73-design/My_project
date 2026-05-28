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
 Essa aula se estende FormatarExceção‚ qual é uma classe de exceção Dart integrada. Inclui propriedades adicionais para armazenar o nome do comando e do argumento associado ao erro. Isso fornece mais contexto ao lidar com a exceção.

comando¡:: O comando que tramitava quando ocorreu a exceção.
argumentoName¡:: O nome do argumento que causou a exceção.
Tarefa 2: Implementar o tratamento de erros no Comma

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

Data: 27/05/2026

Descricao do codigo: Tarefa 1: Crie uma ArgumentException personalizada
#
Primeiro, defina uma classe de exceção personalizada chamada ArgumentoExceção ao to representar erros relacionados a argumentos de linha de comando.

Crie o arquivo command_runner/lib/src/exceptions.dart.O. Neste arquivo estará a definição para seu ArgumentoExceção classe.

Defina uma classe chamada ArgumentoExceção isso que estende-se FormatarExceção.O.

command_runner/lib/src/exceptions.dart

classe ArgumentoExceção estende-se FormatarExceção {
  /// O comando que foi analisado antes de descobrir o erro.
  ///
  /// Isto estará vazio se o erro estava no analisador de raiz.
  final final Barbante¡NÉ? comando¡;

  /// O nome do argumento que estava sendo analisado quando o erro foi
  ///descoberto.
  final final Barbante¡NÉ? argumentoName¡;

  ArgumentoExceção((S)
    super super.O.mensagem‚, [[]
    isto isto.O.comando‚,
    isto isto.O.argumentoName‚,
    super super.O.fonte‚,
    super super.O.offset‚,
  ](S)¡;

  @sobrecarga
  Barbante toString((S)(S) {
    retorno ´ 'ArgumentoExceção: $mensagem´ '¡;
  O}
O}
Essa aula se estende FormatarExceção‚ qual é uma classe de exceção Dart integrada. Inclui propriedades adicionais para armazenar o nome do comando e do argumento associado ao erro. Isso fornece mais contexto ao lidar com a exceção.

comando¡:: O comando que tramitava quando ocorreu a exceção.
argumentoName¡:: O nome do argumento que causou a exceção.

Codigo:

class ArgumentException extends FormatException {
  /// The command that was parsed before discovering the error.
  ///
  /// This will be empty if the error was on the root parser.
  final String? command;

  /// The name of the argument that was being parsed when the error was
  /// discovered.
  final String? argumentName;

  ArgumentException(
    super.message, [
    this.command,
    this.argumentName,
    super.source,
    super.offset,
  ]);

  @override
  String toString() {
    return 'ArgumentException: $message';
  }
}

-------------------------------------------------------------------------------
*/

// Codigo valido ate aqui:

class ArgumentException extends FormatException {
  /// The command that was parsed before discovering the error.
  ///
  /// This will be empty if the error was on the root parser.
  final String? command;

  /// The name of the argument that was being parsed when the error was
  /// discovered.
  final String? argumentName;

  ArgumentException(
    super.message, [
    this.command,
    this.argumentName,
    super.source,
    super.offset,
  ]);

  @override
  String toString() {
    return 'ArgumentException: $message';
  }
}

