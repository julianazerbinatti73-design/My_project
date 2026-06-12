Integrantes da Equipe
Juliana Zerbinatti Sendon Garrido
Julia Souza Zampieri
Maely Peixoto Santos
Maria Eduarda Gonçalves da Silva
-----------------------------------------------------------------------------------------
Objetivo do projeto Dartpedia.

O Dartpedia é uma aplicação de Interface de Linha de Comando (CLI) desenvolvida em Dart, cujo objetivo principal é consolidar as melhores práticas de Programação Orientada a Objetos (POO) e arquitetura de software modular, distribuídas ao longo de todas as lições do curso (da Lição 1 à Lição 12).

-----------------------------------------------------------------------------------------

Tarefa atual 8: Aprimore seu aplicativo CLI - Em andamento da Tarefa 9: Trabalhar com dados JSON


Pré-requisitos para realizar esta tarefa: 
Concluí o Capítulo 7 e ter um ambiente de desenvolvimento Dart funcional com o dartpedia projeto.

Possui familiaridade com conceitos básicos de programação, como variáveis, funções e fluxo de controle.

Compreenda os conceitos de pacotes e bibliotecas em Dart.

Estão familiarizados com princípios de programação orientada a objetos, como herança e classes abstratas.

1. Para que a utilização do Dartpedia seja bem sucedida, primeiramente deve-se instalar o Dart em seu GitHub Codespace.

Abra o terminal e execute:

sudo apt update
sudo apt install -y apt-transport-https wget gnupg

Depois:

wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub 
sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg

depois:

echo "deb [signed-by=/usr/share/keyrings/dart.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" | sudo tee /etc/apt/sources.list.d/dart_stable.list

depois:

sudo apt update
sudo apt install dart

e depois:
Verifique:

dart --version

Se aparecer algo como:

Dart SDK version: 3.x.x

então está tudo certo.

2. Para rodar o código da atividade atual, primeiro entre nas pastas com os seguintes comandos:

cd dartpedia

cd cli

dart run bin/cli.dart help --verbose

(obs: por conta da versão em que o Dartpedia se encontra, apenas este código é válido.)

- Voce deve obter a seguinte saída:
help:  Displays help information. 
           Displays help information. 
           Options: 
           -v,--verbose: Displays detailed help information. 
           -c,--command: Display help for a specific command. 


O resultado indica que o programa está funcionando corretamente. O comando help serve para orientar o usuário sobre como utilizar a aplicação e informa que existem duas opções:

-v ou --verbose: exibe uma ajuda mais detalhada.
-c ou --command: exibe a ajuda de um comando específico.

O interpretador processa os argumentos fornecidos de acordo com a assinatura de métodos e atributos instanciados na classe de comando instalada. Atualmente, o programa aceita e valida o seguinte cenário posicional com flag:
Invocação do Manual Detalhado de Atributos (help --verbose)
Este é o fluxo operacional ativo do sistema. O comando aciona o objeto HelpCommand, que por sua vez dispara o loop interno otimizado com StringBuffer (o buffer analítico). Esse mecanismo extrai e inspeciona os atributos detalhados de cada classe de comando registrada (especificando a opcionalidade de argumentos, tipos de dados esperados e tabelas de flags), renderizando o manual exaustivo através do callback customizado onOutput.
Código: dart run bin/cli.dart help --verbose

3. O arquivo principal do nosso projeto está localizado em:

my_project/My_project/dartpedia/cli/bin/cli.dart

É nele em que o nosso código principal se encontra.

4. Para enviar qualquer alteração feita, no espaço my_project/My_project digite os comandos:

git add .

git push origin main

git commit -m " digite o que alterou/fez no projeto "

- Dessa forma, suas alterações serão enviadas para o github 

4. Para puxar qualquer alteração feita por outro usuário:

git pull origin main

- Com isso, as alterações serão puxadas para o seu Codespace

-----------------------------------------------------------------------------------------

Líder:

° Juliana Zerbinatti Sendon Garrido

Liderados:
Julia Souza Zampieri
Maely Peixoto Santos
Maria Eduarda Gonçalves da Silva
