/*-----------------------------------------------------------------------------

Informacoes:

O arquivo search_results.dart faz parte do pacote wikipedia.

Este arquivo define as classes SearchResult e SearchResults, que modelam e
estruturam a resposta de uma pesquisa por termos na API da Wikipedia, utilizando
list pattern matching para extrair titulos e URLs das paginas retornadas.

search_results.dart - Localizado em /dartpedia/wikipedia/lib/src/model/search_results.dart

Outras informacoes importantes sobre o pacote:

site            :

Autor           : Maria Eduarda Goncalves da silva mariaflaviasilvasilva@gmail.com

Manutencao      :

-------------------------------------------------------------------------------

Funcionamento:

Inicialmente o pacote wikipedia serve como a biblioteca de integracao com a API
web para buscar dados enciclopedicos. Este arquivo especifico transforma a lista
posicional do JSON da Wikipedia em objetos estruturados com o termo buscado,
titulos e links de forma limpa.

Dentro da pasta dartpedia em dartpedia/wikipedia rode o comando
dart analyze; o analisador do Dart deve verificar o arquivo search_results.dart
e certificar que a estrutura de correspondencia de padrao (case [String, Iterable,
Iterable, Iterable]) e o StringBuffer estao corretos.

Obs. Importante ! Este aplicativo esta em desenvolvimento e ao longo do tempo
o comportamento do aplicativo pode mudar. Este arquivo depende do uso interno
do pacote nativo do Dart para lidar com listas e colecoes iteraveis.

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

Data: 12/06/2026

Descricao do codigo: Inicio do arquivo vazio para preparacao da estrutura.

Codigo:
// Arquivo search_results.dart inicializado.

-------------------------------------------------------------------------------

Versao: 0.0.1

Data: 12/06/2026

Descricao do codigo: Crie a classe SearchResults

1. Crie o arquivo wikipedia/lib/src/model/search_results.dart.

2. Adicione o seguinte código a wikipedia/lib/src/model/search_results.dart:

wikipedia/lib/src/model/search_results.dart

class SearchResult {
  SearchResult({required this.title, required this.url});
  final String title;
  final String url;
}

class SearchResults {
  SearchResults(this.results, {this.searchTerm});
  final List<SearchResult> results;
  final String? searchTerm;

  static SearchResults fromJson(List<Object?> json) {
    final List<SearchResult> results = <SearchResult>[];
    if (json case [
      String searchTerm,
      Iterable articleTitles,
      Iterable _,
      Iterable urls,
    ]) {
      final List titlesList = articleTitles.toList();
      final List urlList = urls.toList();
      for (int i = 0; i < articleTitles.length; i++) {
        results.add(SearchResult(title: titlesList[i], url: urlList[i]));
      }
      return SearchResults(results, searchTerm: searchTerm);
    }
    throw FormatException('Could not deserialize SearchResults, json=$json');
  }

  @override
  String toString() {
    final StringBuffer pretty = StringBuffer();
    for (final SearchResult result in results) {
      pretty.write('${result.url} \n');
    }
    return '\nSearchResults for $searchTerm: \n$pretty';
  }
}

Este código define uma SearchResults classe com uma lista de SearchResult objetos e um termo de busca. O fromJson método utiliza correspondência de padrões para extrair os dados do objeto JSON e criar uma nova SearchResults instância. O toString método também fornece uma maneira prática de imprimir o conteúdo do SearchResults objeto.

Codigo: 

class SearchResult {
  SearchResult({required this.title, required this.url});
  final String title;
  final String url;
}

class SearchResults {
  SearchResults(this.results, {this.searchTerm});
  final List<SearchResult> results;
  final String? searchTerm;

  static SearchResults fromJson(List<Object?> json) {
    final List<SearchResult> results = <SearchResult>[];
    if (json case [
      String searchTerm,
      Iterable articleTitles,
      Iterable _,
      Iterable urls,
    ]) {
      final List titlesList = articleTitles.toList();
      final List urlList = urls.toList();
      for (int i = 0; i < articleTitles.length; i++) {
        results.add(SearchResult(title: titlesList[i], url: urlList[i]));
      }
      return SearchResults(results, searchTerm: searchTerm);
    }
    throw FormatException('Could not deserialize SearchResults, json=$json');
  }

  @override
  String toString() {
    final StringBuffer pretty = StringBuffer();
    for (final SearchResult result in results) {
      pretty.write('${result.url} \n');
    }
    return '\nSearchResults for $searchTerm: \n$pretty';
  }
}

-------------------------------------------------------------------------------
*/
//Codigo ate aqui:

//Codigo:

class SearchResult {
  SearchResult({required this.title, required this.url});
  final String title;
  final String url;
}

class SearchResults {
  SearchResults(this.results, {this.searchTerm});
  final List<SearchResult> results;
  final String? searchTerm;

  static SearchResults fromJson(List<Object?> json) {
    final List<SearchResult> results = <SearchResult>[];
    if (json case [
      String searchTerm,
      Iterable articleTitles,
      Iterable _,
      Iterable urls,
    ]) {
      final List titlesList = articleTitles.toList();
      final List urlList = urls.toList();
      for (int i = 0; i < articleTitles.length; i++) {
        results.add(SearchResult(title: titlesList[i], url: urlList[i]));
      }
      return SearchResults(results, searchTerm: searchTerm);
    }
    throw FormatException('Could not deserialize SearchResults, json=$json');
  }

  @override
  String toString() {
    final StringBuffer pretty = StringBuffer();
    for (final SearchResult result in results) {
      pretty.write('${result.url} \n');
    }
    return '\nSearchResults for $searchTerm: \n$pretty';
  }
}

