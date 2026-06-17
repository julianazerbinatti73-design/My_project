/*-----------------------------------------------------------------------------
Informacoes:

O arquivo get_article.dart faz parte do pacote wikipedia.

Este arquivo define a funcao para obter o conteudo completo de um artigo especifico da Wikipédia utilizando o seu titulo como parametro de busca.

get_article.dart - Localizado em wikipedia/lib/src/api/get_article.dart

Outras informacoes importantes sobre o pacote: 

site : 

Autor : Maely Peixoto Santos<maely.santos@portalsesisp.org.br>

Manutencao : 

-------------------------------------------------------------------------------

Funcionamento:

Este arquivo especifico lida com a action 'query' da API da Wikipédia (prop=extracts). Ele recebe o titulo de um artigo, realiza uma requisicao HTTP assincrona do tipo GET e converte a estrutura do JSON recebido em uma lista de objetos do tipo Article.

Dentro da pasta dartpedia em dartpedia/command_runner rode o comando dart analyze; o analisador do Dart deve verificar o arquivo get_article.dart e validar que a estrutura da funcao nao possui erros de sintaxe ou de compilacao.

Obs. Importante ! Este aplicativo esta em desenvolvimento e ao longo do tempo o comportamento do aplicativo pode mudar. Este arquivo depende das bibliotecas nativas 'dart:convert' e 'dart:io', alem do vinculo com o pacote externo 'package:http/http.dart' e o modelo local '../model/article.dart'.

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

Data: 16/06/2026

Descricao do codigo: Inicio do arquivo vazio para preparacao da estrutura.

Codigo:
// Arquivo get_article.dart inicializado.

-------------------------------------------------------------------------------

Versao: 0.0.1

Data: 16/06/2026

Descricao do codigo: Implementar chamadas à API da Wikipédia

Crie o arquivo wikipedia/lib/src/api/get_article.dart.

Adicione o seguinte código a wikipedia/lib/src/api/get_article.dart:

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/article.dart';

Future<List<Article>> getArticleByTitle(String title) async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/w/api.php',
      <String, Object?>{
        // order matters - explaintext must come after prop
        'action': 'query',
        'format': 'json',
        'titles': title.trim(),
        'prop': 'extracts',
        'explaintext': '',
      },
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final Map<String, Object?> jsonData =
          jsonDecode(response.body) as Map<String, Object?>;
      return Article.listFromJson(jsonData);
    } else {
      throw HttpException(
        '[ApiClient.getArticleByTitle] '
        'statusCode=${response.statusCode}, '
        'body=${response.body}',
      );
    }
  } on FormatException {
    // TODO: log
    rethrow;
  } finally {
    client.close();
  }
}

Este código define a getArticleByTitlefunção, que utiliza o httppacote para fazer uma requisição GET à API da Wikipédia e retorna um List<Article>objeto. Esta função recupera o conteúdo de um artigo da Wikipédia com base em seu título.

Codigo:

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/article.dart';

Future<List<Article>> getArticleByTitle(String title) async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/w/api.php',
      <String, Object?>{
        // order matters - explaintext must come after prop
        'action': 'query',
        'format': 'json',
        'titles': title.trim(),
        'prop': 'extracts',
        'explaintext': '',
      },
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final Map<String, Object?> jsonData =
          jsonDecode(response.body) as Map<String, Object?>;
      return Article.listFromJson(jsonData);
    } else {
      throw HttpException(
        '[ApiClient.getArticleByTitle] '
        'statusCode=${response.statusCode}, '
        'body=${response.body}',
      );
    }
  } on FormatException {
    // TODO: log
    rethrow;
  } finally {
    client.close();
  }
}
-------------------------------------------------------------------------------

Código ate aqui : 
*/

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/article.dart';

Future<List<Article>> getArticleByTitle(String title) async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/w/api.php',
      <String, Object?>{
        // order matters - explaintext must come after prop
        'action': 'query',
        'format': 'json',
        'titles': title.trim(),
        'prop': 'extracts',
        'explaintext': '',
      },
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final Map<String, Object?> jsonData =
          jsonDecode(response.body) as Map<String, Object?>;
      return Article.listFromJson(jsonData);
    } else {
      throw HttpException(
        '[ApiClient.getArticleByTitle] '
        'statusCode=${response.statusCode}, '
        'body=${response.body}',
      );
    }
  } on FormatException {
    // TODO: log
    rethrow;
  } finally {
    client.close();
  }
}

