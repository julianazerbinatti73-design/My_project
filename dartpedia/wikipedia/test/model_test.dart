/*-------------------------------------------------------------------------------

Informacoes:

O arquivo model_test.dart faz parte do pacote command_runner.

Essas linhas importam o pacote, que fornece O framework de testes e os arquivos do modelo de dados que você quer testar. As strings constantes declaram a localização dos seus dados de amostra.

model_test.dart - Localizado em /dartpedia/command_runner/lib/src/model_test.dart


Outras informacoes importantes sobre o pacote:

site : 

Autor : Juliana Zerbinatti Sendon Garrido <julianazerbinattu73@gmail.com>

Manutencao : 

---------------------------------------------------------------------------------
Funcionamento:

importa bibliotecas do Dart;
importa classes do projeto (Article, Summary, SearchResults);
importa a biblioteca de testes (test);
define os caminhos dos arquivos JSON que serão usados nos testes automatizados.

-------------------------------------------------------------------------------

Data: 12/06/2026

Versao: 0.0.0

Descricao do codigo: Codigo original

Codigo:

import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:wikipedia/src/model/article.dart';
import 'package:wikipedia/src/model/search_results.dart';
import 'package:wikipedia/src/model/summary.dart';

const String dartLangSummaryJson = './test/test_data/dart_lang_summary.json';
const String catExtractJson = './test/test_data/cat_extract.json';
const String openSearchResponse = './test/test_data/open_search_response.json';


-------------------------------------------------------------------------------
Codigo valido ate aqui:
*/
import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:wikipedia/src/model/article.dart';
import 'package:wikipedia/src/model/search_results.dart';
import 'package:wikipedia/src/model/summary.dart';

const String dartLangSummaryJson = './test/test_data/dart_lang_summary.json';
const String catExtractJson = './test/test_data/cat_extract.json';
const String openSearchResponse = './test/test_data/open_search_response.json';

void main() {
  group('deserialize example JSON responses from wikipedia API', () {
    test('deserialize Dart Programming Language page summary example data from '
        'json file into a Summary object', () async {
      final String pageSummaryInput =
          await File(dartLangSummaryJson).readAsString();
      final Map<String, Object?> pageSummaryMap =
          jsonDecode(pageSummaryInput) as Map<String, Object?>;
      final Summary summary = Summary.fromJson(pageSummaryMap);
      expect(summary.titles.canonical, 'Dart_(programming_language)');
    });

    test('deserialize Cat article example data from json file into '
        'an Article object', () async {
      final String articleJson = await File(catExtractJson).readAsString();
      final Map<String, Object?> articleMap =
          jsonDecode(articleJson) as Map<String, Object?>;
      final List<Article> articles = Article.listFromJson(articleMap);
      expect(articles.first.title.toLowerCase(), 'cat');
    });
  });
}

