/*-------------------------------------------------------------------------------

Informacoes:

O arquivo search.dart faz parte do pacote wikipedia.

Este arquivo define a funcao de busca para consultar e encontrar artigos na API da Wikipédia com base em termos informados pelo usuario.

search.dart - Localizado em wikipedia/lib/src/api/search.dart

Outras informacoes importantes sobre o pacote: 

site : 

Autor : Maely Peixoto Santos<maely.santos@portalsesisp.org.br>

Manutencao : 

---------------------------------------------------------------------------------

Funcionamento:

Este arquivo especifico lida com o endpoint 'opensearch' da API da Wikipédia. Ele recebe uma string de busca, realiza uma requisicao HTTP assincrona do tipo GET e converte a resposta JSON recebida em um objeto do tipo SearchResults.

Dentro da pasta dartpedia em dartpedia/command_runner rode o comando dart analyze; o analisador do Dart deve verificar o arquivo search.dart e validar que a estrutura da funcao nao possui erros de sintaxe ou de compilacao.

Obs. Importante ! Este aplicativo esta em desenvolvimento e ao longo do tempo o comportamento do aplicativo pode mudar. Este arquivo depende das bibliotecas nativas 'dart:convert' e 'dart:io', alem do vinculo com o pacote externo 'package:http/http.dart' e o modelo local '../model/search_results.dart'.

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
// Arquivo search.dart inicializado.

-------------------------------------------------------------------------------

Versao: 0.0.1

Data: 16/06/2026

Descricao do codigo: Implementar chamadas à API da Wikipédia

Em seguida, crie o arquivo wikipedia/lib/src/api/search.dart.

Adicione o seguinte código a wikipedia/lib/src/api/search.dart 

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/search_results.dart';

Future<SearchResults> search(String searchTerm) async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/w/api.php',
      <String, Object?>{
        'action': 'opensearch',
        'format': 'json',
        'search': searchTerm,
      },
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final List<Object?> jsonData = jsonDecode(response.body) as List<Object?>;
      return SearchResults.fromJson(jsonData);
    } else {
      throw HttpException(
        '[WikimediaApiClient.getArticleByTitle] '
        'statusCode=${response.statusCode}, '
        'body=${response.body}',
      );
    }
  } on FormatException {
    rethrow;
  } finally {
    client.close();
  }
}

Este código define a searchfunção, que utiliza o pacote para fazer uma requisição GET ao endpoint httpda API da Wikipédia e retorna um objeto. O endpoint é usado para buscar artigos da Wikipédia com base em um termo de busca.opensearchSearchResultsopensearch

Codigo :

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/search_results.dart';

Future<SearchResults> search(String searchTerm) async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/w/api.php',
      <String, Object?>{
        'action': 'opensearch',
        'format': 'json',
        'search': searchTerm,
      },
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final List<Object?> jsonData = jsonDecode(response.body) as List<Object?>;
      return SearchResults.fromJson(jsonData);
    } else {
      throw HttpException(
        '[WikimediaApiClient.getArticleByTitle] '
        'statusCode=${response.statusCode}, '
        'body=${response.body}',
      );
    }
  } on FormatException {
    rethrow;
  } finally {
    client.close();
  }
}
-------------------------------------------------------------------------------

Código até aqui:
*/

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/search_results.dart';

Future<SearchResults> search(String searchTerm) async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/w/api.php',
      <String, Object?>{
        'action': 'opensearch',
        'format': 'json',
        'search': searchTerm,
      },
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final List<Object?> jsonData = jsonDecode(response.body) as List<Object?>;
      return SearchResults.fromJson(jsonData);
    } else {
      throw HttpException(
        '[WikimediaApiClient.getArticleByTitle] '
        'statusCode=${response.statusCode}, '
        'body=${response.body}',
      );
    }
  } on FormatException {
    rethrow;
  } finally {
    client.close();
  }
}

