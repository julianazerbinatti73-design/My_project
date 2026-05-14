/*-----------------------------------------------------------------------------

//Informacoes:

//O pacote command_runner faz parte do projeto Dartpedia.

//Este arquivo funciona como a interface principal do pacote, definindo o queß sera exposto para o aplicativo CLI. command_runner.dart - Fica localizado na pasta dartpedia, em /dartpedia/command_runner/lib/command_runner.dart

//Outras informacoes importantes sobre o command_runner; nosso pacote:

//site            :

//Autor           : Juliana Zerbinatti Sendon Garrido <julianazerbinatti73@gmail.com>

//Manutencao      :

//-----------------------------------------------------------------------------

//Funcionamento:

//Este pacote define a estrutura de comandos. Ele exporta a classe CommandRunner para que ela possa ser utilizada por outras partes do projeto.

//Dentro da pasta dartpedia em /dartpedia/command_runner, rode o comando dart pub get para instalar e organizar as dependencias internas do pacote.

//Obs. Importante ! Este pacote eh uma biblioteca modular e seu comportamento sera expandido nos proximos capitulos para lidar com comandos complexos.

//-----------------------------------------------------------------------------

//Dicionario do versionamento:

//v = versao

//0 = Inicio do versionamento

//. = Implementacao de versionamento

//1 = Proxima versao, 2, proxima versao, e assim por diante.

//-----------------------------------------------------------------------------

//Historico de versionamento:

//----------------------------------------------------------------------------

//Versao: 0.0.1

//Data: 11/05/2026

//Descricao do codigo:  Implemente a classe CommandRunner

//Agora que você criou o command_runner pacote, adicione uma classe provisória que eventualmente lidará com a lógica de análise dos argumentos da linha de comando.

//1.Abra o command_runner/lib/command_runner.dart arquivo. Remova qualquer código de espaço reservado existente e adicione o seguinte:

/// A simple command runner to handle command-line arguments.
///
/// More extensive documentation for this library goes here.
//library;

//export 'src/command_runner_base.dart';
// TODO: Export any other libraries intended for clients of this package.

//Principais trechos do código anterior:

//library; Declara este arquivo como uma biblioteca, que define os limites e a interface pública de uma unidade reutilizável de código Dart.
//export 'src/command_runner_base.dart'; é uma linha crucial que torna as declarações de command_runner_base.dartdisponíveis para outros pacotes que importam o command_runnerpacote. Sem essa export declaração, as classes e funções dentro command_runner_base.dart seriam privadas ao command_runner pacote e você não conseguiria usá-las em sua dartpedia aplicação.

//Codigo:

/// A simple command runner to handle command-line arguments.
///
/// More extensive documentation for this library goes here.
//library;  //Codigo; Ativar

//export 'src/command_runner_base.dart'; //Codigo; Ativar
// TODO: Export any other libraries intended for clients of this package.

//-----------------------------------------------------------------------------

//Codigo ate aqui:
*/
//Codigo:

library;

export 'src/command_runner_base.dart';
