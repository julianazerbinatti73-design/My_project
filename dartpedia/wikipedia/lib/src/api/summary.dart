/*-----------------------------------------------------------------------------
informacoes:

Os arquivos summary.dart, search.dart e get_article.dart fazem parte do pacote wikipedia.

Estes arquivos definem as chamadas e funções da API para buscar e recuperar dados (resumos, pesquisas e artigos completos) diretamente da Wikipédia.

Arquivos e Localizações:
- wikipedia/lib/src/api/summary.dart     - Recupera resumos de artigos (aleatórios ou por título).
- wikipedia/lib/src/api/search.dart      - Processa consultas de pesquisa para encontrar artigos.
- wikipedia/lib/src/api/get_article.dart  - Obtém o conteúdo completo de um artigo específico. 

Outras informacoes importantes sobre o pacote:

site : 

Autor : Maely Peixoto Santos<maely.santos@portalsesisp.com.br>

Manutencao : 

-------------------------------------------------------------------------------
Funcionamento:

O módulo de API serve como a camada de comunicação assíncrona do pacote wikipedia. Ele realiza requisições HTTP do tipo GET para os endpoints da API da Wikipédia e converte as respostas JSON em objetos fortemente tipados (modelos).

Dentro da pasta dartpedia, você pode validar a sintaxe e a estrutura do código rodando o comando:
dart analyze

Obs. Importante ! Este aplicativo esta em desenvolvimento e ao longo do tempo o comportamento do aplicativo pode mudar. Estes arquivos dependem das bibliotecas nativas 'dart:convert' e 'dart:io', além do pacote externo 'package:http/http.dart' e dos modelos internos correspondentes (summary.dart, search_results.dart e article.dart).

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

//Arquivo summary.dart inicializado.

-------------------------------------------------------------------------------

Versao: 0.0.1

Data: 16/06/2026

Descricao do codigo: Implementar chamadas à API da Wikipédia

Em seguida, você criará as funções da API para buscar dados da Wikipédia. Você criará três arquivos:

summary.dartEste arquivo conterá funções para recuperar resumos de artigos.
search.dartEste arquivo irá processar as consultas de pesquisa para encontrar artigos.
get_article.dartEste arquivo conterá funções para obter o conteúdo completo de um artigo.
Crie o diretório wikipedia/lib/src/api.

Crie o arquivo wikipedia/lib/src/api/summary.dart.

Adicione o seguinte código a wikipedia/lib/src/api/summary.dart:

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/summary.dart';

Future<Summary> getRandomArticleSummary() async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/random/summary',
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final Map<String, Object?> jsonData =
          jsonDecode(response.body) as Map<String, Object?>;
      return Summary.fromJson(jsonData);
    } else {
      throw HttpException(
        '[WikipediaDart.getRandomArticle] '
        'statusCode=${response.statusCode}, body=${response.body}',
      );
    }
  } on FormatException {
    // todo: log exceptions
    rethrow;
  } finally {
    client.close();
  }
}

Future<Summary> getArticleSummaryByTitle(String articleTitle) async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/summary/$articleTitle',
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final Map<String, Object?> jsonData =
          jsonDecode(response.body) as Map<String, Object?>;
      return Summary.fromJson(jsonData);
    } else {
      throw HttpException(
        '[WikipediaDart.getArticleSummary] '
        'statusCode=${response.statusCode}, body=${response.body}',
      );
    }
  } on FormatException {
    // todo: log exceptions
    rethrow;
  } finally {
    client.close();
  }
}
Este código define duas funções: `summary` getRandomArticleSummarye `summary` getArticleSummaryByTitle. Ambas as funções usam o httppacote `wiki` para fazer requisições GET à API da Wikipédia e retornam um Summaryobjeto. getRandomArticleSummary`summary` obtém um resumo de um artigo aleatório, enquanto getArticleSummaryByTitle`summary` obtém um resumo de um artigo específico.

Código:

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/summary.dart';

Future<Summary> getRandomArticleSummary() async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/random/summary',
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final Map<String, Object?> jsonData =
          jsonDecode(response.body) as Map<String, Object?>;
      return Summary.fromJson(jsonData);
    } else {
      throw HttpException(
        '[WikipediaDart.getRandomArticle] '
        'statusCode=${response.statusCode}, body=${response.body}',
      );
    }
  } on FormatException {
    // todo: log exceptions
    rethrow;
  } finally {
    client.close();
  }
}

Future<Summary> getArticleSummaryByTitle(String articleTitle) async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/summary/$articleTitle',
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final Map<String, Object?> jsonData =
          jsonDecode(response.body) as Map<String, Object?>;
      return Summary.fromJson(jsonData);
    } else {
      throw HttpException(
        '[WikipediaDart.getArticleSummary] '
        'statusCode=${response.statusCode}, body=${response.body}',
      );
    }
  } on FormatException {
    // todo: log exceptions
    rethrow;
  } finally {
    client.close();
  }
}

-------------------------------------------------------------------------------

Código ate aqui:
*/

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/summary.dart';

Future<Summary> getRandomArticleSummary() async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/random/summary',
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final Map<String, Object?> jsonData =
          jsonDecode(response.body) as Map<String, Object?>;
      return Summary.fromJson(jsonData);
    } else {
      throw HttpException(
        '[WikipediaDart.getRandomArticle] '
        'statusCode=${response.statusCode}, body=${response.body}',
      );
    }
  } on FormatException {
    // todo: log exceptions
    rethrow;
  } finally {
    client.close();
  }
}

Future<Summary> getArticleSummaryByTitle(String articleTitle) async {
  final http.Client client = http.Client();
  try {
    final Uri url = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/summary/$articleTitle',
    );
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      final Map<String, Object?> jsonData =
          jsonDecode(response.body) as Map<String, Object?>;
      return Summary.fromJson(jsonData);
    } else {
      throw HttpException(
        '[WikipediaDart.getArticleSummary] '
        'statusCode=${response.statusCode}, body=${response.body}',
      );
    }
  } on FormatException {
    // todo: log exceptions
    rethrow;
  } finally {
    client.close();
  }
}
 
