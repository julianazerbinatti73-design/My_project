/*-----------------------------------------------------------------------------

Informacoes:

O arquivo summary.dart faz parte do pacote wikipedia.
Este arquivo define a classe Summary, modelando o objeto de dados que representa
o resumo de um artigo retornado pela API da Wikipedia, utilizando correspondencia
de padroes (pattern matching) para desserializacao do JSON.
summary.dart - Localizado em /dartpedia/wikipedia/lib/src/model/summary.dart
Outras informacoes importantes sobre o pacote:

site :

Autor : Maely Peixoto Santos<maely.santos@portalsesisp.org.br>

manutencao      :

-------------------------------------------------------------------------------

Funcionamento: 

Inicialmente o pacote wikipedia serve como a biblioteca de integracao com a API
web para buscar dados enciclopedicos. Este arquivo especifico define o modelo de
dados Summary, que mapeia campos estruturais como pageid, extract, idioma e links.
Dentro da pasta dartpedia em dartpedia/wikipedia rode o comando
dart analyze; o analisador do Dart deve verificar o arquivo summary.dart e
validar que o mapeamento do fromJson e a dependencia com TitlesSet estao corretos.

-------------------------------------------------------------------------------

Dicionario do Versionamento: 
    
v = versao

0 = Inicio do versionemanto
    
. = Implementacao de versionamento
    
1= Proxima versao, 2, proxima versao, e assim por diante

-------------------------------------------------------------------------------

Historico do versionamento :

-------------------------------------------------------------------------------

Versao: 0.0.0

Data: 11/06/2026

Descricao do codigo: Inicio do arquivo vazio para preparacao da estrutura.

Codigo:

// Arquivo summary.dart inicializado.
-------------------------------------------------------------------------------

Versao: 0.0.1

data: 12/06/2026

descricao do codigo: Criar a classe Summary

A API da Wikipédia retorna um objeto JSON contendo um resumo de um artigo. Vamos criar uma classe em Dart para representar esse resumo. 

1.Crie o diretório wikipedia/lib/src/model 

mkdir -p wikipedia/lib/src/model 

2. Crie o arquivo wikipedia/lib/src/model/summary.dart 

3. Adicione o seguinte código a wikipedia/lib/src/model/summary.dart 

import 'title_set.dart';

class Summary {
  /// Returns a new [Summary] instance.
  Summary({
    required this.titles,
    required this.pageid,
    required this.extract,
    required this.extractHtml,
    required this.lang,
    required this.dir,
    this.url,
    this.description,
  });

  ///
  TitlesSet titles;

  /// The page ID
  int pageid;

  /// First several sentences of an article in plain text
  String extract;

  /// First several sentences of an article in simple HTML format
  String extractHtml;

  /// Url to the article on Wikipedia
  String? url;

  /// The page language code
  String lang;

  /// The page language direction code
  String dir;

  /// Wikidata description for the page
  String? description;

  /// Returns a new [Summary] instance
  static Summary fromJson(Map<String, Object?> json) {
    return switch (json) {
      {
        'titles': final Map<String, Object?> titles,
        'pageid': final int pageid,
        'extract': final String extract,
        'extract_html': final String extractHtml,
        'lang': final String lang,
        'dir': final String dir,
        'content_urls': {
          'desktop': {'page': final String url},
          'mobile': {'page': String _},
        },
        'description': final String description,
      } =>
        Summary(
          titles: TitlesSet.fromJson(titles),
          pageid: pageid,
          extract: extract,
          extractHtml: extractHtml,
          lang: lang,
          dir: dir,
          url: url,
          description: description,
        ),
      {
        'titles': final Map<String, Object?> titles,
        'pageid': final int pageid,
        'extract': final String extract,
        'extract_html': final String extractHtml,
        'lang': final String lang,
        'dir': final String dir,
        'content_urls': {
          'desktop': {'page': final String url},
          'mobile': {'page': String _},
        },
      } =>
        Summary(
          titles: TitlesSet.fromJson(titles),
          pageid: pageid,
          extract: extract,
          extractHtml: extractHtml,
          lang: lang,
          dir: dir,
          url: url,
        ),
      _ => throw FormatException('Could not deserialize Summary, json=$json'),
    };
  }

  @override
  String toString() =>
      'Summary['
      'titles=$titles, '
      'pageid=$pageid, '
      'extract=$extract, '
      'extractHtml=$extractHtml, '
      'lang=$lang, '
      'dir=$dir, '
      'description=$description'
      ']';
}

Este código define uma Summary classe com propriedades que correspondem aos campos da resposta JSON da API da Wikipédia.O fromJson método usa correspondência de padrões para extrair os dados do objeto JSON e criar uma nova Summaryinstância.O toStringmétodo também fornece uma maneira conveniente de imprimir o conteúdo do Summaryobjeto. Observe que a TitlesSetclasse é usada na Summary classe `Wikipedia`, então você precisará criá-la em seguida. 

Código : 

import 'title_set.dart';

class Summary {
  /// Returns a new [Summary] instance.
  Summary({
    required this.titles,
    required this.pageid,
    required this.extract,
    required this.extractHtml,
    required this.lang,
    required this.dir,
    this.url,
    this.description,
  });

  ///
  TitlesSet titles;

  /// The page ID
  int pageid;

  /// First several sentences of an article in plain text
  String extract;

  /// First several sentences of an article in simple HTML format
  String extractHtml;

  /// Url to the article on Wikipedia
  String? url;

  /// The page language code
  String lang;

  /// The page language direction code
  String dir;

  /// Wikidata description for the page
  String? description;

  /// Returns a new [Summary] instance
  static Summary fromJson(Map<String, Object?> json) {
    return switch (json) {
      {
        'titles': final Map<String, Object?> titles,
        'pageid': final int pageid,
        'extract': final String extract,
        'extract_html': final String extractHtml,
        'lang': final String lang,
        'dir': final String dir,
        'content_urls': {
          'desktop': {'page': final String url},
          'mobile': {'page': String _},
        },
        'description': final String description,
      } =>
        Summary(
          titles: TitlesSet.fromJson(titles),
          pageid: pageid,
          extract: extract,
          extractHtml: extractHtml,
          lang: lang,
          dir: dir,
          url: url,
          description: description,
        ),
      {
        'titles': final Map<String, Object?> titles,
        'pageid': final int pageid,
        'extract': final String extract,
        'extract_html': final String extractHtml,
        'lang': final String lang,
        'dir': final String dir,
        'content_urls': {
          'desktop': {'page': final String url},
          'mobile': {'page': String _},
        },
      } =>
        Summary(
          titles: TitlesSet.fromJson(titles),
          pageid: pageid,
          extract: extract,
          extractHtml: extractHtml,
          lang: lang,
          dir: dir,
          url: url,
        ),
      _ => throw FormatException('Could not deserialize Summary, json=$json'),
    };
  }

  @override
  String toString() =>
      'Summary['
      'titles=$titles, '
      'pageid=$pageid, '
      'extract=$extract, '
      'extractHtml=$extractHtml, '
      'lang=$lang, '
      'dir=$dir, '
      'description=$description'
      ']';
}

-------------------------------------------------------------------------------

Código até aqui:

*/ 

import 'title_set.dart';

class Summary {
  /// Returns a new [Summary] instance.
  Summary({
    required this.titles,
    required this.pageid,
    required this.extract,
    required this.extractHtml,
    required this.lang,
    required this.dir,
    this.url,
    this.description,
  });

  ///
  TitlesSet titles;

  /// The page ID
  int pageid;

  /// First several sentences of an article in plain text
  String extract;

  /// First several sentences of an article in simple HTML format
  String extractHtml;

  /// Url to the article on Wikipedia
  String? url;

  /// The page language code
  String lang;

  /// The page language direction code
  String dir;

  /// Wikidata description for the page
  String? description;

  /// Returns a new [Summary] instance
  static Summary fromJson(Map<String, Object?> json) {
    return switch (json) {
      {
        'titles': final Map<String, Object?> titles,
        'pageid': final int pageid,
        'extract': final String extract,
        'extract_html': final String extractHtml,
        'lang': final String lang,
        'dir': final String dir,
        'content_urls': {
          'desktop': {'page': final String url},
          'mobile': {'page': String _},
        },
        'description': final String description,
      } =>
        Summary(
          titles: TitlesSet.fromJson(titles),
          pageid: pageid,
          extract: extract,
          extractHtml: extractHtml,
          lang: lang,
          dir: dir,
          url: url,
          description: description,
        ),
      {
        'titles': final Map<String, Object?> titles,
        'pageid': final int pageid,
        'extract': final String extract,
        'extract_html': final String extractHtml,
        'lang': final String lang,
        'dir': final String dir,
        'content_urls': {
          'desktop': {'page': final String url},
          'mobile': {'page': String _},
        },
      } =>
        Summary(
          titles: TitlesSet.fromJson(titles),
          pageid: pageid,
          extract: extract,
          extractHtml: extractHtml,
          lang: lang,
          dir: dir,
          url: url,
        ),
      _ => throw FormatException('Could not deserialize Summary, json=$json'),
    };
  }

  @override
  String toString() =>
      'Summary['
      'titles=$titles, '
      'pageid=$pageid, '
      'extract=$extract, '
      'extractHtml=$extractHtml, '
      'lang=$lang, '
      'dir=$dir, '
      'description=$description'
      ']';
}





