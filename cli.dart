/*-----------------------------------------------------------------------------

Informacoes:

O aplicativo cli faz parte do projeto Dartpedia.

O cli eh nosso primeiro aplicativo que esta sendo desenvolvido usando Dart.

cli.dart - Fica localizado na pasta dartpedia, em /dartpedia/cli/bin.

Outras informacoes importantes sobre o cli; nosso aplicativo.

site		:

Autor		: Maria Eduarda Goncalves da silva <mariaflaviasilvasilva@gmail.com>

Manutencao	:

-------------------------------------------------------------------------------

Funcionamento:

Iniciamente o cli, ao ser executado, mostra uma saudacao na tela, por exemplo:

Dentro da pasta dartpedia em /home/maria.eduarda/dartpedia/cli rode o  comando dart run; deve aparecer a mensagem de saudacao, "Hello, Dart!"

Obs. Importante ! Este aplicativo esta em desenvolvimento e ao longo do tempo o comportamento do aplicativo pode mudar.

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

Data: 10/04/2026

Descricao do codigo: Codigo original....

Codigo:

import 'package:cli/cli.dart' as cli;

void main(List<String> arguments) {
	print('Hello World: ${cli.calculate()}!');
}

Saida padrao ao executar o codigo:

Comando: dart run bin/cli.dart || dart bin/cli.dart

Saida: Hello World: 42!

-------------------------------------------------------------------------------

Versao: 0.0.1

Data: 10/04/2026

Descricao do codigo: Simplifique a saida por enquanto. Apague a primeira linha (voce nao precisa dessadeclaracao de importacao) e altere a print declaracao para exibir uma saudacao simples:

import 'package:cli/cli.dart' as cli; // Delete this entire line

void main(List<String> arguments) {
 	 print('Hello, Dart!'); // Change this line
}

4. Salve o arquivo. Em seguida, no terminal, execute o programa novamente:

Codigo:

void main(List<String> arguments) {
	print('Hello, Dart!:');
}

Saida padrao ao executar o codigo: 

Comando: dart run || dart run bin/cli.dart

Saida: Hello, Dart!

-------------------------------------------------------------------------------

Versao: 0.0.2

Data: 10/04/2026

Descricao do codigo: Implemente o versioncomando em cli/bin/cli.dart: Adicione logica para lidar com um versioncomando que imprime a versao atual da CLI. Use um if instruÃ§Ã£o `if` para verificar se o primeiro argumento fornecido eh `true` version. Voce tambem precisara de uma version constante.

Primeiro, acima da sua main funcao, declare uma const variavel para a versao. O valor de uma const variavel nunca pode ser alterado depois de ter sido definido:

const version = '0.0.1'; // Add this line

Em seguida, modifique sua mainfuncao para verificar o versionargumento:

void main(List<String> arguments) {
	if (arguments.isEmpty) {
		print('Hello, Dart!');
	} else if (arguments.first == 'version') {
		print('Dartpedia CLI version $version');
	}
}

Essa $version sintaxe eh chamada de interpolacao de strings. Ela permite incorporar o valor da variavel diretamente em uma string, prefixando o nome da variavel com um $sinal.

Codigo:


const version = '0.0.2';

void main(List<String> arguments) {
	if (arguments.isEmpty) {
		print('Hello, Dart!');
	} else if (arguments.first == 'version') {
		print('Dartpedia CLI version $version');
	}
} 


Saida padrao ao executar o codigo:

Comando: Dart run

Saida: Hello, Dart!

Comando: dart bin/cli.dart version 

Saida: Dartpedia CLI version 0.0.2

-------------------------------------------------------------------------------

Versao: 0.0.3

Data: 10/04/2026

Descricao do codigo: Adicione uma printUsage funcao: Para tornar a saida mais amigavel ao usuario, crie uma funcao separada para exibir as informacoes de uso. Coloque essa funcao fora e abaixo da sua main funcao principal.

void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}

search eh o comando que eventualmente fara a busca na Wikipedia.

Codigo:

const version = '0.0.3';

void main(List<String> arguments) {
	if (arguments.isEmpty) {
  		print('Hello, Dart!');
	} else if (arguments.first == 'version') {
		print('Dartpedia CLI version $version');
	}
}

Saida padrao ao executar o codigo:

Comando: dart run

Saida: Hello, dart!

Comando: dart run bin/cli.dart version

Saida: Dartpedia CLI version 0.0.3

-------------------------------------------------------------------------------

Versao: 0.0.4

Data: 10/04/2026

Descricao do codigo: Implemente o help comando e refine main: Agora, integre o help comando usando uma else if instrucao e limpe o comportamento padrao para chamar a printUsage funcao.

Modifique sua main funcao para que fique assim:

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage(); // Change this from 'Hello, Dart!'
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else {
    printUsage(); // Catch-all for any unrecognized command.
  }
}


5. Entenda a if/else estrutura e as variaveis: Agora que voce implementou o fluxo de controle na main funcao, revise o codigo que foi adicionado a ela.

    . arguments.isEmpty Verifica se nenhum argumento de linha de comando foi fornecido.

    . arguments.first Acessa o primeiro argumento, que voce esta usando como nosso comando.

    . version eh declarado como um const. Isso significa que seu valor eh conhecido em tempo de compilacao e voce nao pode altera-lo durante a execucao.
    
    . arguments eh uma variavel regular (nao constante) porque seu conteudo pode mudar durante a execucao com base na entrada do usuario.
                       

Codigo:

const version = '0.0.4';

void main(List<String> arguments) {
	if (arguments.isEmpty || arguments.first == 'help') {
		printUsage();
	} else if (arguments.first == 'version') {
		print('Dartpedia CLI version $version');
  } else {
  printUsage(); // Catch-all for any unrecognized command.
   }
 }

void printUsage() { // Add this new function
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'");
}

Saida padrao ao executar o codigo: 

Comando: dart bin/cli.dart help || dart run

Saida: Hello, Dart!

Comando: dart bin/cli.dart version

Saida: Dartpedia CLI version 0.0.4

Comando: dart run

Saida: Building package executable ...
Built cli:cli.
The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

-------------------------------------------------------------------------------

Versao: 0.0.5

Data: 17/04/2026

Descricao do codigo: Implementar o comando de busca

Em seguida, implemente um comando basico search que receba o titulo de um artigo como entrada. Ao desenvolver essa funcionalidade, voce trabalhara com List manipulacao de dados, verificacao de valores nulos e interpolacao de strings.

1. Integre o search comando em main: Primeiro, modifique a mainfuncao cli/bin/cli.dart para incluir um else if ramo que lide com o search comando. Por enquanto, basta imprimir uma mensagem de espaÃ§o reservado.

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    print('Search command recognized!');
  } else {
    printUsage();
  }
}

Codigo:

const version = '0.0.5';

void main(List<String> arguments) {
   if (arguments.isEmpty || arguments.first == 'help') {
	 printUsage(); // Change this from 'Hello, Dart!'
  } else if (arguments.first == 'version') {
   	 print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
  	 print('Search command recognized!');
  } else {
    printUsage();
  }
}

void printUsage() { // Add this new function
     print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE.'");
}

Saida padrao ao executar o codigo:

Comando: dart bin/cli.dart search 

Saida: Search command recognized!

Comando: dart bin/cli.dart version

Saida: Dartpedia CLI version 0.0.5

Comando: dart bin/cli.dart help

Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE.'

Comando: dart run

Saida: Building package executable ...
Built cli:cli.
The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

-------------------------------------------------------------------------------

Versao: 0.0.6

Data: 17/04/2026

Descricao do codigo: Defina a searchWikipedia funcao: O search comando eventualmente executara a logica principal do seu aplicativo chamando uma funcao chamada searchWikipedia. Por enquanto, faca com que ela searchWikipedia imprima os argumentos passados para ela com o search comando. 

Coloque esta nova funcao abaixo de main.

// ... (your existing main function)

void searchWikipedia(List<String>? arguments) { // Add this new function and add ? to arguments type
  print('searchWikipedia received arguments: $arguments');
}

// ... (your existing printUsage() function)

Principais trechos do codigo anterior:

List<String>? arguments significa que a arguments prÃ³pria lista pode ser null.

Observacao

O Dart impoe uma seguranca robusta contra valores nulos , o que significa que voce precisa declarar explicitamente quando uma variavel pode ser nula. Qualquer variavel que nao seja marcada como anulavel tem a garantia de nunca ser nula, mesmo em producao.

O objetivo da seguranca contra valores nulos nao eh impedir que voce use `null` em seu codigo, pois representar a ausencia de um valor pode ser util. Em vez disso, ela visa forcar voce a considerar a possibilidade de valores nulos e, portanto, a ser mais cuidadoso com ela. Juntamente com o analisador, isso ajuda a prevenir uma das falhas de tempo de execucao mais comuns em programacao: erros de ponteiro nulo.

Codigo:

const version = '0.0.6';

void main(List<String> arguments) {
    if (arguments.isEmpty || arguments.first == 'help') {
      printUsage();
    } else if (arguments.first == 'version') {
      print('Dartpedia CLI version $version');
    } else if (arguments.first == 'search') {
      print('Search command recognized!');
    } else if (arguments.first == 'searchWikipedia') {
       print('searchWikipedia received arguments: $arguments');
    } else {
      printUsage();
    }
}

void searchWikipedia(List<String>? arguments) { // Add this new function and add ? to arguments type
      print('searchWikipedia received arguments: $arguments');
}
void printUsage() { // Add this new function
      print("The following commands are valid: 'help', 'version' , 'search <ARTICLE-TITLE>'");
}

Saida padrao ao executar o codigo:

Comando: dart bin/cli.dart || dart cli.dart || dart bin/cli.dart help

Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart bin/cli.dart version || dart cli.dart version

Saida: Dartpedia CLI version 0.0.6

Comando: dart bin/cli.dart search || dart cli.dart search

Saida: Search command recognized!

Comando: dart bin/cli.dart searchWikipedia || dart cli.dart searchWikipedia

Saida: searchWikipedia received arguments: [searchWikipedia] 

Comando: dart run

Saida:Building package executable ...
Built cli:cli.
The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

-------------------------------------------------------------------------------

Versao: 0.0.7

Data: 24/04/2026

Descricao do codigo: Chame a searchWikipedia funcao a partir da mainfuncao: Agora, modifique o search bloco de comando main para chamar searchWikipedia e passar quaisquer argumentos que venham apos o search proprio comando. Use arguments.sublist(1) para obter todos os argumentos a partir do segundo. Se nenhum argumento for fornecido apos search, passe null para searchWikipedia.

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

Principais trechos do codigo anterior:

final As variaveis so podem ser definidas uma vez e sao usadas quando voce nao pretende altera-las novamente no codigo.
arguments.sublist(1) cria uma nova lista contendo todos os elementos da arguments lista apos o primeiro elemento (que era search).
arguments.length > 1 ? ... : null;eh um operador condicional (ternario). Ele garante que, se nenhum argumento for fornecido apos o search comando, inputArgsse torne null, correspondendo ao comportamento do codigo de exemplo para searchWikipedia o arguments parametro de List<String>?.

5. Teste searchWikipedia com argumentos: Usando a linha de comando, execute o aplicativo com um titulo de artigo de teste:

dart bin/cli.dart search Dart Programming

VocÃª deveria ver:

searchWikipedia received arguments: [Dart, Programming]

Em seguida, execute o mesmo comando sem os argumentos adicionais:

dart bin/cli.dart search

Voce deveria ver:

searchWikipedia received arguments: null

Codigo:

const version = '0.0.7';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
	printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
  searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) {
   print('searchWikipedia recived arguments: $arguments');
}

void printUsage() {
print(
"The following commands are valid: 'help', 'version' , 'search <ARTICLE-TITLE>'");
}

Saida padrao ao executar o codigo:

Comando: Dart run || dart bin/cli. dart || dart bin/cli.dart help 

Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart bin/cli.dart search Dart Programming

Saida: searchWikipedia received arguments: [Dart, Programming]

Comando: dart cli. dart search

Saida: searchWikipedia recived arguments: null

Comando: dart cli.dart version

Saida: Dartpedia CLI version 0.0.7

Comando: dart run

Saida: Building package executable ...
Built cli:cli.
The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

-------------------------------------------------------------------------------

Versao: 0.0.8

Data: 24/04/2026

Descricao do codigo: Lide com a falta do titulo do artigo e a entrada do usuario com o stdin comando: Eh mais amigavel ao usuario solicitar o titulo caso ele nao o forneca na linha de comando. Use stdin.readLineSync() para isso.

Primeiro, adicione a importacao necessaria no inicio do seu cli/bin/cli.dart arquivo:

import 'dart:io'; // Add this line at the top

dart:io Eh uma biblioteca central no SDK do Dart e fornece APIs para lidar com arquivos, diretorios, sockets, clientes e servidores HTTP, e muito mais.

Agora, atualize sua searchWikipedia funÃ§ao.

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Await input and provide a default empty string if the input is null.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into a single string.
    articleTitle = arguments.join(' ');
  }

  print('Current article title: $articleTitle');
}

O bloco de codigo anterior introduz alguns conceitos-chave:

Declara uma final String articleTitle variavel. Isso permite que a analise estatica detecte que ela articleTitle sera um valor Stringe nao sera nula.

Em seguida, uma if/else instrucao verifica se os argumentos da linha de comando para a pesquisa foram fornecidos.

Caso faltem argumentos, o programa solicita informacoes ao usuario, le a entrada usando `read` stdin.readLineSync()e lida de forma segura com os casos em que nenhuma entrada eh fornecida.

Caso existam argumentos , ele arguments.join(' ') os combina em uma unica string de busca.

Principais trechos do codigo anterior:

stdin.readLineSync() ?? ''Le a entrada do usuario. Embora stdin.readLineSync() possa retornar nulo, o operador de coalescencia nula (`\ ??n`) eh usado para fornecer uma string vazia (`\ ''n`) como alternativa caso a entrada seja nula. Esta eh uma maneira concisa de garantir que a variavel seja uma string nao nula.

arguments.join(' ') Concatena todos os elementos da arguments lista em uma unica string, usando um espaÃ§o como separador. Por exemplo, ['Dart', 'Programming'] torna-se "Dart Programming". Isso eh crucial para tratar entradas de linha de comando com varias palavras como uma unica frase de pesquisa.

A analise estÃ¡tica do Dart pode detectar que a articleTitle variavel eh garantidamente inicializada quando a instrucao `print` eh executada. Independentemente do caminho percorrido dentro do corpo desta funcao, a variavel nao pode ser nula.

Codigo: 

import 'dart:io';

const version = '0.0.8';

void main(List<String> arguments) {
     if (arguments.isEmpty || arguments.first == 'help') {
	printUsage();
  } else if (arguments.first == 'version') {
	print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
   searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void printUsage() {
 print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'");
}
void searchWikipedia(List<String>? arguments) {
   final String articleTitle;
   if (arguments == null || arguments.isEmpty) {
	print('Please provide an article title.');
	articleTitle = stdin.readLineSync() ?? '';
 } else {
	articleTitle = arguments. join(' ');
 }
  print('Current article title: $articleTitle');
}

Saida padrao ao executar o codigo:

Comando: dart cli.dart || dart cli.dart help // Se voce estiver na ~Dartpedia/cli/bin, se estiver na ~Darpedia/cli, acrescente o bin na frente. Ficando assim: dart bin/cli.dart.

Saida: The following commands are valid; 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart cli.dart search

Saida: Please provide an article title
Exemplo da escolha: A
Saida: Current article title: A

Comando: dart cli.dart version

Saida: Dartpedia CLI version 0.0.8

Comando: dart cli.dart search Dart Programming

Saida: Current article title: Dart Programming

Comando: dart run

Saida:Building package executable ...
Built cli:cli.
The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

-------------------------------------------------------------------------------

Versao: 0.0.9

Data: 24/04/2026

Descricao do codigo: Finalizar searchWikipedia a impressao de resultados de pesquisa simulados: Atualize searchWikipedia para exibir mensagens que indiquem que nosso programa encontrou algo. Isso nos ajuda a visualizar o que nosso programa final fara sem precisar compila-lo completamente agora. Voce so vera essas mensagens se incluir uma consulta de pesquisa ao executar o programa.

Por exemplo: dart bin/cli.dart search Dart Programming.

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Await input and provide a default empty string if the input is null.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into the CLI into a single string
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}

Codigo:

import 'dart:io';

const version = '0.0.9';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
	printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) {
    final String articleTitle;
    if (arguments == null || arguments.isEmpty) {
      print('Please provide an article title.');
      articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join(' ');
  }

    print('Looking up articles about "$articleTitle". Please wait.');
    print('Here ya go!');
    print('(Pretend this is an article about "$articleTitle")');
}

void printUsage() {
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'");
}

Saida padrao ao executar o codigo:

Comando: dart run || dart bin/cli.dart help

Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart bin/cli.dart search

Saida: Please provide an article title
Exemplo de comando: help
Saida: Looking up articles about "help". Please wait. - Here ya go !. - (Pretend this is an article    about "help")

Comando: dart bin/cli.dart version

Saida: Dartpedia CLI version 0.0.9

Comando: dart bin/cli.dart search Dart Programming

Saida: Looking up articles about "Dart Programming". Please wait. Here ya go !. (Pretend this is an   article about "Dart Programming")

-------------------------------------------------------------------------------

Versao: 0.0.10

Data: 27/04/2026

Descricao do codigo: Importar o pacote http

Agora que você adicionou o http pacote, precisa importá-lo para o seu arquivo Dart para usar suas funcionalidades.

Abra o dartpedia/bin/cli.dart arquivo.

Adicione a seguinte import declaração no início do arquivo, juntamente com a dart:io importação existente:

import 'dart:io';
import 'package:http/http.dart' as http; // Add this line
Esta linha importa o http pacote e atribui a ele o alias http. Depois disso, você pode se referir a classes e funções dentro do http pacote usando http.(por exemplo, http.Client, http.get). A as http parte é uma convenção padrão para evitar conflitos de nomenclatura caso outra biblioteca importada também tenha uma classe ou função com nome semelhante.

Codigo:

import 'dart:io';

import 'package:http/http.dart' as http; // Add this line

const version = '0.0.10';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
        printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) {
    final String articleTitle;
    if (arguments == null || arguments.isEmpty) {
      print('Please provide an article title.');
      articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join(' ');
  }
    print('Looking up articles about "$articleTitle". Please wait.');
    print('Here ya go!');
    print('(Pretend this is an article about "$articleTitle")');
}

void printUsage() {
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'");
}

Saida padrao ao executar o codigo:

Comando: dart run

Saida: Resolving dependencies in `/home/maria_e_silva64/dartpedia/cli`... 
Downloading packages... 
Got dependencies in `/home/maria_e_silva64/dartpedia/cli`.
Resolving dependencies in `/home/maria_e_silva64/dartpedia/cli`... 
Downloading packages... 
Got dependencies in `/home/maria_e_silva64/dartpedia/cli`.
Building package executable... 
Built cli:cli.
The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'

Comando: dart bin/cli.dart help

Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart bin/cli.dart search

Saida: Please provide an article title
Exemplo de comando: help
Saida: Looking up articles about "help". Please wait. - Here ya go !. - (Pretend this is an article    about "help")

Comando: dart bin/cli.dart search help //Procura imediata, da palavra "help"

Saída: Looking up articles about "help". Please wait.
Here ya go!
(Pretend this is an article about "help") 

Comando: dart bin/cli.dart version

Saida: Dartpedia CLI version 0.0.10

Comando: dart bin/cli.dart search Dart Programming

Saida: Looking up articles about "Dart Programming". Please wait. Here ya go !. (Pretend this is an   article about "Dart Programming")

------------------------------------------------------------------------------- 

Versao: 0.0.11

Data: 28/04/2026

Descricao do codigo:  Implementar a getWikipediaArticle função. 

Agora, crie uma nova função chamada `getData` getWikipediaArticle que lide com a busca de dados de uma API externa. Essa função será chamada asyncde `getData` porque as requisições de rede são operações assíncronas.

Defina a assinatura da função: Abaixo da sua main função (e printUsage função), adicione a seguinte assinatura de função.

// ... (your existing printUsage() function)


  //You'll add more code here soon
}

Principais trechos do código anterior:

O Future<String>tipo de retorno indica que esta função eventualmente produzirá um String resultado, mas não imediatamente, pois é uma operação assíncrona.
A async palavra-chave marca a função como assíncrona, permitindo que você a utilize await dentro dela.

2.Construa a URL da API: Dentro da sua nova getWikipediaArticle função, crie um Uri objeto. O `url` Uri representa o end point da API da Wikipédia que você chamará para obter um resumo do artigo.

Adicione estas linhas dentro da getWikipediaArticle função:

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  // ...
}

3.Faça a requisição HTTP e processe a resposta: get Agora, use a função de nível superior para package:http fazer uma GET requisição HTTP para a URL que você acabou de construir. A await palavra-chave `pause` pausa a execução de `request` getWikipediaArticle até que a get chamada seja concluída e retorne um http.Response objeto.

Após a conclusão da requisição, verifique o status response.statusCode para garantir que a requisição foi bem-sucedida (um código de status 1 200 significa OK). Se bem-sucedida, retorne o objeto response.body`request`, que contém os dados obtidos (neste caso, JSON bruto). Se a requisição falhar, retorne uma mensagem de erro informativa.

Adicione estas linhas após a Uri construção dentro de getWikipediaArticle:

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org',
    '/api/rest_v1/page/summary/$articleTitle',
  );
  final response = await http.get(url); // Make the HTTP request

  if (response.statusCode == 200) {
    return response.body; // Return the response body if successful
  }

  // Return an error message if the request failed
  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}

Codigo:

import 'dart:io';

import 'package:http/http.dart' as http; // Add this line

const version = '0.0.11';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
        printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) {
    final String articleTitle;
    if (arguments == null || arguments.isEmpty) {
      print('Please provide an article title.');
      articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join(' ');
  }

    print('Looking up articles about "$articleTitle". Please wait.');
    print('Here ya go!');
    print('(Pretend this is an article about "$articleTitle")');
}


void printUsage() {
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'");
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  final response = await http.get(url); // Make the HTTP request

  if (response.statusCode == 200) {
    return response.body; // Return the response body if successful
  }

  // Return an error message if the request failed
  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}

Saida padrao ao executar o codigo:

Comando: dart run 

Saida: Resolving dependencies in `/home/maria_e_silva64/dartpedia/cli`... 
Downloading packages... 
Got dependencies in `/home/maria_e_silva64/dartpedia/cli`.
Building package executable... 
Built cli:cli.
The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'

Comando: dart bin/cli.dart help

Saída: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart bin/cli.dart search

Saída: Please provide an article title
help
Looking up articles about "help". Please wait.
Here ya go!
(Pretend this is an article about "help")

Comando: dart bin/cli.dart version

Saída: Dartpedia CLI version 0.0.11

Comando: dart bin/cli.dart search help //Procura imediata, da palavra "help"

Saída: Looking up articles about "help". Please wait.
Here ya go!
(Pretend this is an article about "help") 

Comando: dart bin/cli.dart search Dart Programming

Saída: Looking up articles about "Dart Programming". Please wait.
Here ya go!
(Pretend this is an article about "Dart Programming")

-------------------------------------------------------------------------------

Versao: 0.0.12

Data: 28/04/2026

Descricao do codigo: Integrar a chamada da API na pesquisa da Wikipédia

Você integrará a chamada da API em searchWikipedia. Essa função conterá a lógica principal para lidar com o wikipedia comando.

Atualização searchWikipedia para uso async: Localize sua searchWikipediafunção e atualize sua assinatura para async que ela agora execute operações assíncronas.

Sua searchWikipediafunção agora deve ter esta aparência (parte inicial):

// ... (your existing main function)

void searchWikipedia(List<String>? arguments) async { // Added 'async'
  final String? articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    articleTitle = stdin.readLineSync(); // Await input from the user
    // You'll add error handling for null input here in a moment
  } else {
    // Otherwise, join the arguments into the CLI into a single string
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}

// ... (your existing printUsage() function)
Principais trechos do código anterior:

void searchWikipedia(List<String>? arguments) asyncA função agora é async. Isso é essencial porque ela chamará getWikipediaArticle, que async por si só é uma função e precisará de await seu resultado.

2.Adicione null verificações de entrada do usuário para strings vazias: Dentro searchWikipedia do if bloco que trata o caso em que nenhum argumento é fornecido, refine-o. Se stdin.readLineSync()o resultado for nulo null(por exemplo, se o usuário pressionar Ctrl+D/Ctrl+Z) ou uma string vazia, imprima uma mensagem e saia da função.

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    final inputFromStdin = stdin.readLineSync(); // Read input
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return; // Exit the function if no valid input
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}

3.Chame a função getWikipediaArticle e imprima o resultado: Agora, modifique a searchWikipediafunção para chamar sua nova getWikipediaArticlefunção e imprimir o resultado. Em seguida, substitua as print instruções de espaço reservado anteriores pela chamada de API real.

// ... (beginning of searchWikipedia function, after determining articleTitle)

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    final inputFromStdin = stdin.readLineSync();
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return;
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');

  // Call the API and await the result
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent); // Print the full article response (raw JSON for now)
}
Principais trechos do código anterior:

await getWikipediaArticle(articleTitle)Como `is` getWikipediaArticle eh uma asyncfunção, você precisa retornar o await resultado dela. Isso pausa a searchWikipediafunção até que o Future<String>resultado retornado por `is` getWikipediaArticle seja resolvido em um ` Stringarticle` contendo o conteúdo do artigo.
print(articleContent)Exibe o resumo do artigo obtido como uma string JSON bruta no console.

Codigo:

import 'dart:io';

import 'package:http/http.dart' as http; // Add this line

const version = '0.0.12';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
        printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) async { 
  final String articleTitle;
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    final inputFromStdin = stdin.readLineSync(); 
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return; 
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
}

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');


  // Call the API and await the result
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent); // Print the full article response (raw JSON for now)
}


void printUsage() {
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'");
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  final response = await http.get(url); // Make the HTTP request

  if (response.statusCode == 200) {
    return response.body; // Return the response body if successful
  }

  // Return an error message if the request failed
  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
} 

Saida padrao ao executar o codigo:

Comando: dart run

Saida: Resolving dependencies in `/home/maria_e_silva64/dartpedia/cli`... 
Downloading packages... 
Got dependencies in `/home/maria_e_silva64/dartpedia/cli`.
Resolving dependencies in `/home/maria_e_silva64/dartpedia/cli`... 
Downloading packages... 
Got dependencies in `/home/maria_e_silva64/dartpedia/cli`.
Building package executable... 
Built cli:cli.
The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'

Comando: dart bin/cli.dart version

Saida: Dartpedia CLI version 0.0.12

Comando: dart bin/cli.dart help

Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'

Comando:  dart bin/cli.dart search

Saida: Please provide an article title.
Amora //Exemplo da pesquisa
Looking up articles about "Amora". Please wait.
Here ya go!
(Pretend this is an article about "Amora")
{"type":"disambiguation","title":"Amora","displaytitle":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Amora</span></span>","namespace":{"id":0,"text":""},"wikibase_item":"Q474029","titles":{"canonical":"Amora","normalized":"Amora","display":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Amora</span></span>"},"pageid":31763593,"lang":"en","dir":"ltr","revision":"1258749586","tid":"a268866b-a800-11ef-bbc9-6ff7288d42b3","timestamp":"2024-11-21T12:03:35Z","description":"Topics referred to by the same term","description_source":"local","content_urls":{"desktop":{"page":"https://en.wikipedia.org/wiki/Amora","revisions":"https://en.wikipedia.org/wiki/Amora?action=history","edit":"https://en.wikipedia.org/wiki/Amora?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Amora"},"mobile":{"page":"https://en.wikipedia.org/wiki/Amora","revisions":"https://en.wikipedia.org/wiki/Special:History/Amora","edit":"https://en.wikipedia.org/wiki/Amora?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Amora"}},"extract":"Amora may refer to:","extract_html":"<p><b>Amora</b> may refer to:</p>"}

// search, sem acompanhamento eh necessario inserir o titulo. Sempre uma unica palavra, se for duas coloque "_", entre as palavras.

Comando:  dart bin/cli.dart search Dart // Usando "Dart" de exemplo

Saida: Looking up articles about "Dart". Please wait.
Here ya go!
(Pretend this is an article about "Dart")
{"type":"disambiguation","title":"Dart","displaytitle":"<span class=\"mw-page-title-main\">Dart</span>","namespace":{"id":0,"text":""},"wikibase_item":"Q278999","titles":{"canonical":"Dart","normalized":"Dart","display":"<span class=\"mw-page-title-main\">Dart</span>"},"pageid":285448,"lang":"en","dir":"ltr","revision":"1317832908","tid":"8661c1c4-ad8e-11f0-a289-0734ceb38d9c","timestamp":"2025-10-20T08:26:50Z","description":"Topics referred to by the same term","description_source":"local","content_urls":{"desktop":{"page":"https://en.wikipedia.org/wiki/Dart","revisions":"https://en.wikipedia.org/wiki/Dart?action=history","edit":"https://en.wikipedia.org/wiki/Dart?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Dart"},"mobile":{"page":"https://en.wikipedia.org/wiki/Dart","revisions":"https://en.wikipedia.org/wiki/Special:History/Dart","edit":"https://en.wikipedia.org/wiki/Dart?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Dart"}},"extract":"Dart or DART may refer to:","extract_html":"<p><b>Dart</b> or <b>DART</b> may refer to:</p>"}

Comando:  dart run bin/cli.dart search "Dart_(programming_language)"  //Duas palavras com o uso de "_"

Saida: Looking up articles about "Dart_(programming_language)". Please wait.
Here ya go!
(Pretend this is an article about "Dart_(programming_language)")
{"type":"standard","title":"Dart (programming language)","displaytitle":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Dart (programming language)</span></span>","namespace":{"id":0,"text":""},"wikibase_item":"Q406009","titles":{"canonical":"Dart_(programming_language)","normalized":"Dart (programming language)","display":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Dart (programming language)</span></span>"},"pageid":33033735,"lang":"en","dir":"ltr","revision":"1345875735","tid":"4e944080-2ad3-11f1-994d-6f4e54cabf85","timestamp":"2026-03-28T18:24:07Z","description":"Programming language","description_source":"local","content_urls":{"desktop":{"page":"https://en.wikipedia.org/wiki/Dart_(programming_language)","revisions":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=history","edit":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Dart_(programming_language)"},"mobile":{"page":"https://en.wikipedia.org/wiki/Dart_(programming_language)","revisions":"https://en.wikipedia.org/wiki/Special:History/Dart_(programming_language)","edit":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Dart_(programming_language)"}},"extract":"Dart is a programming language designed by Lars Bak and Kasper Lund and developed by Google. It can be used to develop web and mobile apps as well as server and desktop applications.","extract_html":"<p><b>Dart</b> is a programming language designed by Lars Bak and Kasper Lund and developed by Google. It can be used to develop web and mobile apps as well as server and desktop applications.</p>"}

-------------------------------------------------------------------------------

Versao: 0.0.13

Data: 29/04/2026

Descricao do codigo: Atualizar a página principal para chamar a pesquisa na Wikipédia

Por fim, atualize sua main função para chamar a nova searchWikipedia função quando o wikipedia comando for usado.

Localize o else if bloco na sua main função que atualmente lida com o search comando. Altere o nome do comando de search para wikipedia e atualize a chamada da função.

No código de exemplo, main não há await chamada para searchWikipedia, o que significa que main o próprio não precisa ser marcado async.

Sua main função agora deve ter esta aparência:

// ... (existing const version declaration and printUsage function)

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') { // Changed to 'wikipedia'
    // Pass all arguments *after* 'wikipedia' to searchWikipedia
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs); // Call searchWikipedia (no 'await' needed here for main)
  } else {
    printUsage(); // Catch all for any unrecognized command.
  }
}
arguments.sublist(1)Esta função extrai todos os elementos da argumentslista, começando pelo segundo elemento (índice 1). Isso remove efetivamente o wikipedia próprio comando, de forma que searchWikipediaa lista receba apenas os argumentos do título do artigo.
searchWikipedia(inputArgs)Isso chama searchWikipedia diretamente. Como main não precisa fazer nada depois de searchWikipedia ser concluído, você não precisa chamá await-lo de main. Portanto main, não precisa ser async.

Codigo:

import 'dart:io';

import 'package:http/http.dart' as http; // Add this line

const version = '0.0.13';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
        printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    final inputFromStdin = stdin.readLineSync();
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return;
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
}

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');


  // Call the API and await the result
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent); // Print the full article response (raw JSON for now)
}


void printUsage() {
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'");
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  final response = await http.get(url); // Make the HTTP request

  if (response.statusCode == 200) {
    return response.body; // Return the response body if successful
  }

  // Return an error message if the request failed
  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}

Saida padrao ao executar o codigo:

Comando:  dart run

Saida: Resolving dependencies in `/home/maria_e_silva64/dartpedia/cli`... 
Downloading packages... 
Got dependencies in `/home/maria_e_silva64/dartpedia/cli`.
Resolving dependencies in `/home/maria_e_silva64/dartpedia/cli`... 
Downloading packages... 
Got dependencies in `/home/maria_e_silva64/dartpedia/cli`.
Building package executable... 
Built cli:cli.
The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'

Comando:  dart bin/cli.dart help

Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'

Comando:  dart bin/cli.dart version

Saida: Dartpedia CLI version 0.0.13

Comando: dart bin/cli.dart wikipedia //Mesma funcao que a antiga do search

Saida: Please provide an article title.
Flutter_(software) //Exemplo de titulo. Obs. Veja que o flutter tem mais de um titulo, por isso usa o "_".
Looking up articles about "Flutter_(software)". Please wait.
Here ya go!
(Pretend this is an article about "Flutter_(software)")
{"type":"standard","title":"Flutter (software)","displaytitle":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Flutter (software)</span></span>","namespace":{"id":0,"text":""},"wikibase_item":"Q39072787","titles":{"canonical":"Flutter_(software)","normalized":"Flutter (software)","display":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Flutter (software)</span></span>"},"pageid":54699721,"lang":"en","dir":"ltr","revision":"1347263878","tid":"73169b4b-3119-11f1-94b2-e94f4d9a1be6","timestamp":"2026-04-05T18:01:20Z","description":"Open-source UI software development kit (SDK) for cross-platform applications","description_source":"local","content_urls":{"desktop":{"page":"https://en.wikipedia.org/wiki/Flutter_(software)","revisions":"https://en.wikipedia.org/wiki/Flutter_(software)?action=history","edit":"https://en.wikipedia.org/wiki/Flutter_(software)?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Flutter_(software)"},"mobile":{"page":"https://en.wikipedia.org/wiki/Flutter_(software)","revisions":"https://en.wikipedia.org/wiki/Special:History/Flutter_(software)","edit":"https://en.wikipedia.org/wiki/Flutter_(software)?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Flutter_(software)"}},"extract":"Flutter is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web, Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017. Flutter is used internally by Google in apps such as Google Pay and Google Earth as well as by other software developers including ByteDance and Alibaba.","extract_html":"<p><b>Flutter</b> is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web, Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017. Flutter is used internally by Google in apps such as Google Pay and Google Earth as well as by other software developers including ByteDance and Alibaba.</p>"}

Comando: dart run bin/cli.dart wikipedia "Dart_(programming_language)" //Pesquisa direta sem ter que colocar o titulo.

Saida: Looking up articles about "Dart_(programming_language)". Please wait.
Here ya go!
(Pretend this is an article about "Dart_(programming_language)")
{"type":"standard","title":"Dart (programming language)","displaytitle":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Dart (programming language)</span></span>","namespace":{"id":0,"text":""},"wikibase_item":"Q406009","titles":{"canonical":"Dart_(programming_language)","normalized":"Dart (programming language)","display":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Dart (programming language)</span></span>"},"pageid":33033735,"lang":"en","dir":"ltr","revision":"1345875735","tid":"4e944080-2ad3-11f1-994d-6f4e54cabf85","timestamp":"2026-03-28T18:24:07Z","description":"Programming language","description_source":"local","content_urls":{"desktop":{"page":"https://en.wikipedia.org/wiki/Dart_(programming_language)","revisions":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=history","edit":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Dart_(programming_language)"},"mobile":{"page":"https://en.wikipedia.org/wiki/Dart_(programming_language)","revisions":"https://en.wikipedia.org/wiki/Special:History/Dart_(programming_language)","edit":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Dart_(programming_language)"}},"extract":"Dart is a programming language designed by Lars Bak and Kasper Lund and developed by Google. It can be used to develop web and mobile apps as well as server and desktop applications.","extract_html":"<p><b>Dart</b> is a programming language designed by Lars Bak and Kasper Lund and developed by Google. It can be used to develop web and mobile apps as well as server and desktop applications.</p>"}

-------------------------------------------------------------------------------

//Codigo ate aqui:

//Codigo:
*/
import 'dart:io';

import 'package:http/http.dart' as http; // Add this line

const version = '0.0.13';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
        printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    final inputFromStdin = stdin.readLineSync();
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return;
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
}

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');


  // Call the API and await the result
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent); // Print the full article response (raw JSON for now)
}


void printUsage() {
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'");
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  final response = await http.get(url); // Make the HTTP request

  if (response.statusCode == 200) {
    return response.body; // Return the response body if successful
  }

  // Return an error message if the request failed
  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}

OI 
