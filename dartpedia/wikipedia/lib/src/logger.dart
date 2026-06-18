/*-----------------------------------------------------------------------------

Informacoes: 

O arquivo logger.dart faz parte do pacote cli, integrado ao projeto Dartpedia.

200~Este arquivo define e inicializa a infraestrutura de rastreamento e auditoria
do sistema por meio da funcao initFileLogger. Ele eh encarregado de instanciar
o mecanismo de logging e gerenciar a persistencia fisica de arquivos de log.

logger.dart - Localizado em /dartpedia/cli/lib/src/logger.dart

Outras informacoes importantes sobre o pacote logger.dart: 

site            :

Autor           : Maely Peixoto Santos<maely.santos@gmail.com>

Manutencao      :

-------------------------------------------------------------------------------

Funcionamento: 

Este modulo fornece isolamento logico para diagnosticos do sistema. A funcao
initFileLogger habilita o registro hierarquico, localiza dinamicamente o diretorio
raiz do projeto via metadados de plataforma (Platform.script), garante a existencia
da pasta 'logs' e assina um ouvinte assincrono (listener) para anexar cada entrada
de registro formatada no arquivo correspondente.

Dentro da pasta dartpedia em /dartpedia/cli, execute o comando dart pub get
para garantir a resolucao da dependencia externa do pacote 'logging'. 

--------------------------------------------------------------------------------

Dicionario do versionamento:

v = versao

0 = Inicio do versionamento

. = Implementacao de versionamento

1 = Proxima versao, 2, proxima versao, e assim por diante.

-------------------------------------------------------------------------------

Historico de versionamento:

-------------------------------------------------------------------------------

Versao: 0.0.0

Data: 18/06/2026

Descricao do codigo: Estruturacao basica do arquivo e definicao de escopo.

Codigo:
// Arquivo logger.dart inicializado. 

------------------------------------------------------------------------------- 

Versao: 0.0.1

Data: 18/06/2026

Descricao do codigo: Criar um registrador de dados 

Em seguida, crie uma Loggerinstância e configure-a para gravar mensagens de log em um arquivo. Isso envolve a criação de um novo arquivo para o logger e a configuração das importações necessárias.

Crie um novo arquivo chamado cli/lib/src/logger.dart.

Adicione as importações necessárias e defina a initFileLoggerfunção. 

import 'dart:io';
import 'package:logging/logging.dart';

Logger initFileLogger(String name) {
  // Enables logging from child loggers.
  hierarchicalLoggingEnabled = true;

  // Create a logger instance with the provided name.
  final logger = Logger(name);
  final now = DateTime.now();

  // The rest of the function will be added below.
  // ...

  return logger;
}
Adicione o código para encontrar o diretório raiz do projeto, criar um logsdiretório caso ele não exista e criar um arquivo de log exclusivo.

Logger initFileLogger(String name) {
  hierarchicalLoggingEnabled = true;
  final logger = Logger(name);
  final now = DateTime.now();

  // Get the path to the project directory from the current script.
  final scriptFile = File(Platform.script.toFilePath());
  final projectDir = scriptFile.parent.parent.path;

  // Create a 'logs' directory if it doesn't exist.
  final dir = Directory('$projectDir/logs');
  if (!dir.existsSync()) dir.createSync();

  // Create a log file with a unique name based on
  // the current date and logger name.
  final logFile = File(
    '${dir.path}/${now.year}_${now.month}_${now.day}_$name.txt',
  );

  // The rest of the function will be added below.
  // ...

  return logger;
}
Configure o nível de registro (logger) e configure um ouvinte (listener) para gravar mensagens de log no arquivo.

Logger initFileLogger(String name) {
  hierarchicalLoggingEnabled = true;
  final logger = Logger(name);
  final now = DateTime.now();

  final scriptFile = File(Platform.script.toFilePath());
  final projectDir = scriptFile.parent.parent.path;
  final dir = Directory('$projectDir/logs');
  if (!dir.existsSync()) dir.createSync();
  final logFile = File(
    '${dir.path}/${now.year}_${now.month}_${now.day}_$name.txt',
  );

  // Set the logger level to ALL, so it logs all messages regardless of severity.
  // Level.ALL is useful for development and debugging, but you'll likely want to
  // use a more restrictive level like Level.INFO or Level.WARNING in production.
  logger.level = Level.ALL;

  // Listen for log records and write each one to the log file.
  logger.onRecord.listen((record) {
    final msg =
        '[${record.time} - ${record.loggerName}] ${record.level.name}: ${record.message}';
    logFile.writeAsStringSync('$msg \n', mode: FileMode.append);
  });

  return logger;
}
Este código faz o seguinte:

Permite o registro hierárquico usando hierarchicalLoggingEnabled = true.
Cria uma Loggerinstância com o nome fornecido.
Ele obtém o diretório do projeto do arquivo Platform.script.path.
Cria um logsdiretório caso ele não exista.
Ele cria um arquivo de registro com a data atual e o nome do logger.
Isso define o nível de registro como Level.ALL, o que significa que todas as mensagens serão registradas. Isso é útil para desenvolvimento e depuração, mas provavelmente você desejará usar um nível mais restritivo, como Level.INFOou , Level.WARNINGem produção.
Ele fica à escuta de registros de log e os grava no arquivo de log.


Código :
*/

import 'dart:io';
import 'package:logging/logging.dart';

Logger initFileLogger(String name) {
  hierarchicalLoggingEnabled = true;
  final logger = Logger(name);
  final now = DateTime.now();

  final scriptFile = File(Platform.script.toFilePath());
  final projectDir = scriptFile.parent.parent.path;
  final dir = Directory('$projectDir/logs');
  if (!dir.existsSync()) dir.createSync();
  final logFile = File(
    '${dir.path}/${now.year}_${now.month}_${now.day}_$name.txt',
  );

  logger.level = Level.ALL;

  logger.onRecord.listen((record) {
    final msg =
        '[${record.time} - ${record.loggerName}] ${record.level.name}: ${record.message}';
    logFile.writeAsStringSync('$msg \n', mode: FileMode.append);
  });

  return logger;
} 
