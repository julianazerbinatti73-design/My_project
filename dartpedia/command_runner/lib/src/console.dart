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

O console.dart ao ser executado, melhora o enum da cor do console e melhora a formatacao de texto, aperfeicoando a experiencia dos usuarios do nosso aplicativo CLI Dartpedia. 

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

Data: 29/05/2026

Descricao do codigo: Tarefa 1: Melhorar o enum da cor do console
#
Primeiro, adicione cor à saída do console. O The Cor do console enum incluirá valores RGB e métodos para aplicação de cores no texto.

Criar o comando_runner/lib/src/console.dart arquivo.

Adicione o seguinte código para definir o Cor do console enúm:

comando_runner/lib/src/console.dart
importação ´ 'dardo:io´ '¡;

const Barbante ansiEscapeLiteral = ´ '\x1B´ '¡;

/// Divide strings em caracteres `\n`, then write each line to the
/// console. [duration] define quantos milissegundos haverá
/// entre cada linha imprimir.
Futuro<vazio› › escrever((S)Barbante texto‚, {intemp duração = 50O}(S) assíncrono {
  final final List<Barbante› › linhas de = texto.O.cisão((S)´ '\n´ '(S)¡;
  para por ((S)final final Barbante l em (em) linhas de(S) {
    aguardem _atrasouImprimir((S)´ '$ l \n´ '‚, duração¡:: duração(S)¡;
  O}
O}

/// Imprime linha-a-linha
Futuro<vazio› › _atrasouImprimir((S)Barbante texto‚, {intemp duração = 0O}(S) assíncrono {
  retorno Futuro<vazio› ›.O.atrasou((S)
    Duração((S)milissegundos¡:: duração(S)‚,
    ((S)(S) => stdout.O.escrever((S)texto(S)‚,
  (S)¡;
O}

cores formatadas em /// RGB que são usadas para estilizar entrada
///
/// Todas as cores do guia de estilo da marca Dart
///
/// Como demo, inclui apenas cores com que este programa se preocupa.
/// Se quiser usar mais cores, adicione aqui.
enum Cor do console {
  /// Azul celeste - #b8eafe
  azul Claro((S)184‚, 234‚, 254(S)‚,

  /// Cores do sotaque das diretrizes da marca da Dart
  /// Vermelho quente - #F25D50
  vermelho (red)((S)242‚, 93‚, 80(S)‚,

  /// Amarelo claro - #F9F8C4
  amarelo amarelo((S)249‚, 248‚, 196(S)‚,

  ///Cinza claro, bom para texto, #F8F9FA
  cinza((S)240‚, 240‚, 240(S)‚,

  ///
  branco((S)255‚, 255‚, 255(S)¡;

  const Cor do console((S)isto isto.O.r. r‚, isto isto.O.g. g‚, isto isto.O.b. b(S)¡;

  final final intemp r. r¡;
  final final intemp g. g¡;
  final final intemp b. b¡;
O}
Este enum define um conjunto de cores de console com seus valores RGB correspondentes. Cada cor é uma instância constante do Cor do console enúm.

Codigo:

import 'dart:io';

const String ansiEscapeLiteral = '\x1B';

/// Splits strings on `\n` characters, then writes each line to the
/// console. [duration] defines how many milliseconds there will be
/// between each line print.
Future<void> write(String text, {int duration = 50}) async {
  final List<String> lines = text.split('\n');
  for (final String l in lines) {
    await _delayedPrint('$l \n', duration: duration);
  }
}

/// Prints line-by-line
Future<void> _delayedPrint(String text, {int duration = 0}) async {
  return Future<void>.delayed(
    Duration(milliseconds: duration),
    () => stdout.write(text),
  );
}

/// RGB formatted colors that are used to style input
///
/// All colors from Dart's brand styleguide
///
/// As a demo, only includes colors this program cares about.
/// If you want to use more colors, add them here.
enum ConsoleColor {
  /// Sky blue - #b8eafe
  lightBlue(184, 234, 254),

  /// Accent colors from Dart's brand guidelines
  /// Warm red - #F25D50
  red(242, 93, 80),

  /// Light yellow - #F9F8C4
  yellow(249, 248, 196),

  /// Light grey, good for text, #F8F9FA
  grey(240, 240, 240),

  ///
  white(255, 255, 255);

  const ConsoleColor(this.r, this.g, this.b);

  final int r;
  final int g;
  final int b;
}

-------------------------------------------------------------------------------

Versao: 0.0.1

Data: 29/05/2026

Descricao do codigo: Adicionar métodos ao Cor do console enum para aplicação de cores ao texto:

comando_runner/lib/src/console.dart
enum Cor do console {
  // ... (valores enum existentes)

  const Cor do console((S)isto isto.O.r. r‚, isto isto.O.g. g‚, isto isto.O.b. b(S)¡;

  final final intemp r. r¡;
  final final intemp g. g¡;
  final final intemp b. b¡;

  /// Alterar a cor do texto para toda a saída futura (até a redefinição)
  /// ```dart
  /// print('olá'); // prints na cor padrão do terminal
  /// imprimir(ConsoleColor.red.enableForeground);
  /// print ('olá'); // prints na cor vermelha
  /// ```
  Barbante obter habilitarForeground => ´ '$ansiEscapeLiteral[38;2;$r¡;$ g¡;${b}m. m´ '¡;

  /// Alterar a cor do texto para toda a saída futura (até a redefinição)
  /// ```dart
  /// print('olá'); // prints na cor padrão do terminal
  /// imprimir(ConsoleColor.red.enableBackground);
  /// print('olá'); // prints com cor de fundo vermelho
  /// ```
  Barbante obter habilitar background => ´ '$ansiEscapeLiteral[48;2;$r¡;$ g¡;${b}m. m´ '¡;

  /// Redefinir texto e cor de fundo para padrões de terminal
  estático Barbante obter reiniciar => ´ '$ansiEscapeLiteral[0m´ '¡;

  /// Define cor de texto para a entrada
  Barbante aplicarForeground((S)Barbante texto(S) {
    retorno ´ '$ansiEscapeLiteral[38;2;$r¡;$ g¡;${b}m. m$texto$reset´ '¡;
  O}

  /// Define a cor de fundo e, em seguida, redefine a mudança de cor
  Barbante aplicarAntecedente((S)Barbante texto(S) {
    retorno ´ '$ansiEscapeLiteral[48;2;$r¡;$ g¡;${b}m. m$texto$ansiEscapeLiteral[0m´ '¡;
  O}
O}
Esses métodos utilizam códigos de fuga ANSI ao to aplicar as cores de primeiro plano e de fundo no texto. O The aplicarForeground e, e aplicarAntecedente métodos retornam uma string com os códigos de escape ANSI aplicados.

Codigo:
*/

import 'dart:io';

const String ansiEscapeLiteral = '\x1B';

/// Splits strings on `\n` characters, then writes each line to the
/// console. [duration] defines how many milliseconds there will be
/// between each line print.
Future<void> write(String text, {int duration = 50}) async {
  final List<String> lines = text.split('\n');
  for (final String l in lines) {
    await _delayedPrint('$l \n', duration: duration);
  }
}

/// Prints line-by-line
Future<void> _delayedPrint(String text, {int duration = 0}) async {
  return Future<void>.delayed(
    Duration(milliseconds: duration),
    () => stdout.write(text),
  );
}

/// RGB formatted colors that are used to style input
///
/// All colors from Dart's brand styleguide
///
/// As a demo, only includes colors this program cares about.
/// If you want to use more colors, add them here.
enum ConsoleColor {
  /// Sky blue - #b8eafe
  lightBlue(184, 234, 254),

  /// Accent colors from Dart's brand guidelines
  /// Warm red - #F25D50
  red(242, 93, 80),

  /// Light yellow - #F9F8C4
  yellow(249, 248, 196),

  /// Light grey, good for text, #F8F9FA
  grey(240, 240, 240),

  ///
  white(255, 255, 255);

  const ConsoleColor(this.r, this.g, this.b);

  final int r;
  final int g;
  final int b;

  /// Change text color for all future output (until reset)
  /// ```dart
  /// print('hello'); // prints in terminal default color
  /// print(ConsoleColor.red.enableForeground);
  /// print('hello'); // prints in red color
  /// ```
  String get enableForeground => '$ansiEscapeLiteral[38;2;$r;$g;${b}m';

  /// Change text color for all future output (until reset)
  /// ```dart
  /// print('hello'); // prints in terminal default color
  /// print(ConsoleColor.red.enableBackground);
  /// print('hello'); // prints with red background color
  /// ```
  String get enableBackground => '$ansiEscapeLiteral[48;2;$r;$g;${b}m';

  /// Reset text and background color to terminal defaults
  static String get reset => '$ansiEscapeLiteral[0m';

  /// Sets text color for the input
  String applyForeground(String text) {
    return '$ansiEscapeLiteral[38;2;$r;$g;${b}m$text$reset';
  }

  /// Sets background color and then resets the color change
  String applyBackground(String text) {
    return '$ansiEscapeLiteral[48;2;$r;$g;${b}m$text$ansiEscapeLiteral[0m';
  }
}

