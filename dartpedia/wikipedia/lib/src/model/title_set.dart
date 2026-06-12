/*-----------------------------------------------------------------------------

Informacoes:

O arquivo title_set.dart faz parte do pacote wikipedia.
A classe usa uma classe para representar as informações do título. Vamos criar essa aula agora. SummaryTitlesSet
title_set.dart - Localizado em /dartpedia/wikipedia/lib/src/model/title_set.dart
Outras informacoes importantes sobre o pacote:

site :

Autor : juliana zerbinatti sendon garrido <julianazerbinatti73@gmail.com>

manutencao      :

-------------------------------------------------------------------------------

Funcionamento: 

Esse código define uma classe com propriedades que correspondem a a informação do título na resposta JSON da API da Wikipédia. O método utiliza correspondência de padrões para extrair os dados do objeto JSON e criar uma nova instância. O método oferece uma maneira conveniente de Imprima o conteúdo do objeto.TitlesSetfromJsonTitlesSettoStringTitlesSet

-------------------------------------------------------------------------------

Dicionario do Versionamento: 
    
v = versao

0 = Inicio do versionemanto
    
. = Implementacao de versionamento
    
1= Proxima versao, 2, proxima versao, e assim por diante

-------------------------------------------------------------------------------

Historico do versionamento :

-------------------------------------------------------------------------------

Data: 12/06/2026

Versao: 0.0.0

Descricao do codigo: Codigo original

Codigo:

class TitlesSet {
  /// Returns a new [TitlesSet] instance.
  TitlesSet({
    required this.canonical,
    required this.normalized,
    required this.display,
  });

  /// the DB key (non-prefixed), e.g. may have _ instead of spaces,
  /// best for making request URIs, still requires Percent-encoding
  String canonical;

  /// the normalized title (https://www.mediawiki.org/wiki/API:Query#Example_2:_Title_normalization),
  /// e.g. may have spaces instead of _
  String normalized;

  /// the title as it should be displayed to the user
  String display;

  /// Returns a new [TitlesSet] instance and imports its values from a JSON map
  static TitlesSet fromJson(Map<String, Object?> json) {
    if (json case {
      'canonical': final String canonical,
      'normalized': final String normalized,
      'display': final String display,
    }) {
      return TitlesSet(
        canonical: canonical,
        normalized: normalized,
        display: display,
      );
    }
    throw FormatException('Could not deserialize TitleSet, json=$json');
  }

  @override
  String toString() =>
      'TitlesSet['
      'canonical=$canonical, '
      'normalized=$normalized, '
      'display=$display'
      ']';
}

-------------------------------------------------------------------------------

Codigo valido ate aqui:

*/

class TitlesSet {
  /// Returns a new [TitlesSet] instance.
  TitlesSet({
    required this.canonical,
    required this.normalized,
    required this.display,
  });

  /// the DB key (non-prefixed), e.g. may have _ instead of spaces,
  /// best for making request URIs, still requires Percent-encoding
  String canonical;

  /// the normalized title (https://www.mediawiki.org/wiki/API:Query#Example_2:_Title_normalization),
  /// e.g. may have spaces instead of _
  String normalized;

  /// the title as it should be displayed to the user
  String display;

  /// Returns a new [TitlesSet] instance and imports its values from a JSON map
  static TitlesSet fromJson(Map<String, Object?> json) {
    if (json case {
      'canonical': final String canonical,
      'normalized': final String normalized,
      'display': final String display,
    }) {
      return TitlesSet(
        canonical: canonical,
        normalized: normalized,
        display: display,
      );
    }
    throw FormatException('Could not deserialize TitleSet, json=$json');
  }

  @override
  String toString() =>
      'TitlesSet['
      'canonical=$canonical, '
      'normalized=$normalized, '
      'display=$display'
      ']';
}
 
