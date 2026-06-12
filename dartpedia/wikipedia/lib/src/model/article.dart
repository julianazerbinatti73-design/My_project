/*-----------------------------------------------------------------------------

Versao 0.0.0

Data: 12/06/2026

Descricao do codigo:
Criar a classe Artigo
#
A API da Wikipédia também retorna uma lista de artigos nos resultados da busca. Vamos criar uma classe em Dart para representar um artigo.

Crie o arquivo wikipedia/lib/src/model/article.dart.

Adicione o seguinte código a wikipedia/lib/src/model/article.dart:

wikipedia/lib/src/model/article.dart
class Article {
  Article({required this.title, required this.extract});

  final String title;
  final String extract;

  static List<Article> listFromJson(Map<String, Object?> json) {
    final List<Article> articles = <Article>[];
    if (json case {'query': {'pages': final Map<String, Object?> pages}}) {
      for (final MapEntry<String, Object?>(:Object? value) in pages.entries) {
        if (value case {
          'title': final String title,
          'extract': final String extract,
        }) {
          articles.add(Article(title: title, extract: extract));
        }
      }
      return articles;
    }
    throw FormatException('Could not deserialize Article, json=$json');
  }

  Map<String, Object?> toJson() => <String, Object?>{
    'title': title,
    'extract': extract,
  };

  @override
  String toString() {
    return 'Article{title: $title, extract: $extract}';
  }
}
Este código define uma Articleclasse com propriedades para o título e o resumo de um artigo. O listFromJsonmétodo utiliza correspondência de padrões para extrair os dados do objeto JSON e criar uma lista de Articleinstâncias. O toJsonmétodo converte o Articleobjeto de volta para um objeto JSON. O toStringmétodo fornece uma maneira conveniente de imprimir o conteúdo do Articleobjeto.

Codigo: 
*/


class Article {
  Article({required this.title, required this.extract});

  final String title;
  final String extract;

  static List<Article> listFromJson(Map<String, Object?> json) {
    final List<Article> articles = <Article>[];
    if (json case {'query': {'pages': final Map<String, Object?> pages}}) {
      for (final MapEntry<String, Object?>(:Object? value) in pages.entries) {
        if (value case {
          'title': final String title,
          'extract': final String extract,
        }) {
          articles.add(Article(title: title, extract: extract));
        }
      }
      return articles;
    }
    throw FormatException('Could not deserialize Article, json=$json');
  }

  Map<String, Object?> toJson() => <String, Object?>{
    'title': title,
    'extract': extract,
  };

  @override
  String toString() {
    return 'Article{title: $title, extract: $extract}';
  }
}

