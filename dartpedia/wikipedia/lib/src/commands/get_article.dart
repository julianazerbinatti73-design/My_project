/*-----------------------------------------------------------------------------
Informacoes:

O arquivo get_article.dart faz parte do pacote cli, integrado ao projeto Dartpedia.

Este arquivo define a classe GetArticleCommand, que herda da classe abstrata Command.
Ela eh especializada em buscar e renderizar o conteudo de um artigo enciclopedico
especifico com base em seu titulo canonico, utilizando injecao de dependencia
para logs e tratamento robusto de excecoes de rede e desserializacao.

get_article.dart - Localizado em /dartpedia/wikipedia/lib/src/commands/get_article.dart

Outras informacoes importantes sobre o pacote:

site            :

Autor           : Maria Eduarda Gonçalves da Silva < mariaflaviasilvasilva@gmail.com>

Manutencao      :
-------------------------------------------------------------------------------
Funcionamento:

Esta classe implementa o contrato polimorfico do interpretador CLI. O metodo run()
intercepta os argumentos, invoca a camada de integracao com a Web API da Wikipedia
(getArticleByTitle), processa os payloads e extrai o artigo mais relevante. A resposta
eh formatada de forma eficiente por meio de um StringBuffer, limitando a exibicao
inicial a 500 palavras.

Dentro da pasta dartpedia em /dartpedia/wikipedia , rode o comando dart analyze
para validar a integridade dos tipos e heranca do GetArticleCommand.

Obs. Importante ! Este comando depende diretamente do tratamento defensivo de erros
(HttpException e FormatException), desviando as falhas de conexao para a instancia
injetada do Logger antes de retornar a mensagem de erro ao console.

--------------------------------------------------------------------------------

Dicionario do versionamento:

v = versao
0 = Inicio do versionamento
. = Implementacao de versionamento
1 = Proxima versao, 2, proxima versao, e assim por diante.

-------------------------------------------------------------------------------

Historico de Versionamento:

-------------------------------------------------------------------------------

Versao: 0.0.0

Data: 18/06/2026

Descricao do codigo: Estruturacao do escopo do comando e importacoes iniciais

-------------------------------------------------------------------------------

Versao: 0.0.1

Data: 18/06/2026

Descricao do codigo: Criar o comando GetArticleCommand

Agora, crie o GetArticleCommand arquivo e adicione o código necessário. O código é semelhante ao anterior SearchCommand, pois também utiliza um try/catchbloco para lidar com possíveis erros de rede ou de dados.

1. Crie um novo arquivo chamado cli/lib/src/commands/get_article.dart.

2. Adicione o seguinte código a get_article.dart.


import 'dart:async';
import 'dart:io';

import 'package:command_runner/command_runner.dart';
import 'package:logging/logging.dart';
import 'package:wikipedia/wikipedia.dart';

class GetArticleCommand extends Command {
  GetArticleCommand({required this.logger});

  final Logger logger;

  @override
  String get description => 'Read an article from Wikipedia';

  @override
  String get name => 'article';

  @override
  String get help => 'Gets an article by exact canonical wikipedia title.';

  @override
  String get defaultValue => 'cat';

  @override
  String get valueHelp => 'STRING';

  @override
  FutureOr<String> run(ArgResults args) async {
    try {
      var title = args.commandArg ?? defaultValue;
      final List<Article> articles = await getArticleByTitle(title);
      // API returns a list of articles, but we only care about the closest hit.
      final article = articles.first;
      final buffer = StringBuffer('\n=== ${article.title.titleText} ===\n\n');
      buffer.write(article.extract.split(' ').take(500).join(' '));
      return buffer.toString();
    } on HttpException catch (e) {
      logger
        ..warning(e.message)
        ..warning(e.uri)
        ..info(usage);
      return e.message;
    } on FormatException catch (e) {
      logger
        ..warning(e.message)
        ..warning(e.source)
        ..info(usage);
      return e.message;
    }
  }
}

Revise o código que você acabou de adicionar. E SearchCommand agora GetArticleCommand: 


° Importe os pacotes necessários, como command_runner, logging, e , wikipedia para usar suas classes e funções.
° Aceite uma Logger instância através do seu construtor. Este é um padrão comum chamado injeção de dependência, que permite que o comando registre eventos sem precisar criar seu próprio logger.
° Implemente um run método que defina a lógica do comando. Este método chama a API apropriada da Wikipédia e formata a saída.
° Inclua try/catch blocos para lidar de forma elegante com erros de rede ( HttpException) e erros de análise de dados ( FormatException), registrando-os para depuração.

Codigo: 

import 'dart:async';
import 'dart:io';

import 'package:command_runner/command_runner.dart';
import 'package:logging/logging.dart';
import 'package:wikipedia/wikipedia.dart';

class GetArticleCommand extends Command {
  GetArticleCommand({required this.logger});

  final Logger logger;

  @override
  String get description => 'Read an article from Wikipedia';

  @override
  String get name => 'article';

  @override
  String get help => 'Gets an article by exact canonical wikipedia title.';

  @override
  String get defaultValue => 'cat';

  @override
  String get valueHelp => 'STRING';

  @override
  FutureOr<String> run(ArgResults args) async {
    try {
      var title = args.commandArg ?? defaultValue;
      final List<Article> articles = await getArticleByTitle(title);
      // API returns a list of articles, but we only care about the closest hit.
      final article = articles.first;
      final buffer = StringBuffer('\n=== ${article.title.titleText} ===\n\n');
      buffer.write(article.extract.split(' ').take(500).join(' '));
      return buffer.toString();
    } on HttpException catch (e) {
      logger
        ..warning(e.message)
        ..warning(e.uri)
        ..info(usage);
      return e.message;
    } on FormatException catch (e) {
      logger
        ..warning(e.message)
        ..warning(e.source)
        ..info(usage);
      return e.message;
    }
  }
}

-------------------------------------------------------------------------------

*/
//Codigo ate aqui:

//Codigo: 

import 'dart:async';
import 'dart:io';

import 'package:command_runner/command_runner.dart';
import 'package:logging/logging.dart';
import 'package:wikipedia/wikipedia.dart';

class GetArticleCommand extends Command {
  GetArticleCommand({required this.logger});

  final Logger logger;

  @override
  String get description => 'Read an article from Wikipedia';

  @override
  String get name => 'article';

  @override
  String get help => 'Gets an article by exact canonical wikipedia title.';

  @override
  String get defaultValue => 'cat';

  @override
  String get valueHelp => 'STRING';

  @override
  FutureOr<String> run(ArgResults args) async {
    try {
      var title = args.commandArg ?? defaultValue;
      final List<Article> articles = await getArticleByTitle(title);
      // API returns a list of articles, but we only care about the closest hit.
      final article = articles.first;
      final buffer = StringBuffer('\n=== ${article.title.titleText} ===\n\n');
      buffer.write(article.extract.split(' ').take(500).join(' '));
      return buffer.toString();
    } on HttpException catch (e) {
      logger
        ..warning(e.message)
        ..warning(e.uri)
        ..info(usage);
      return e.message;
    } on FormatException catch (e) {
      logger
        ..warning(e.message)
        ..warning(e.source)
        ..info(usage);
      return e.message;
    }
  }
}

