# FangAndFriends - Deploys

## [Jogar Fang and Friends](http://ec2-15-228-3-72.sa-east-1.compute.amazonaws.com/#/)


[FangAndFriends Gameplay](https://github.com/joaoreis/multiplayer-snake-game/assets/857735/6922fdae-02c5-43c1-b6e0-5317825b8b29)


Este é o repositório que contém scripts e arquivos de configuração relacionados aos deploys do jogo "FangAndFriends" - um jogo da cobrinha multiplayer.

## Tecnologias Utilizadas

- [GitHub Actions](https://github.com/features/actions): Automação de workflows no GitHub. 
- [Docker](https://www.docker.com/): Plataforma para desenvolvimento, envio e execução de aplicativos em containers.
- [Docker Compose](https://docs.docker.com/compose/): Ferramenta para definir e gerenciar aplicações multi-container com Docker.
- Scripts em bash para implantação no servidor
## GitHub Action para Deploy Automatizado

A GitHub Action neste repositório é responsável por automatizar o processo de deploy do jogo "FangAndFriends" 
no Amazon EC2, que é um serviço de computação em nuvem da Amazon Web Services (AWS). A action é acionada sempre que 
ocorre um push para a branch main dos repositórios do [frontend](https://github.com/joaoreis/multiplayer-snake-game#readme) e do [backend](https://github.com/joaoreis/multiplayer-snake-game-backend#readme).

Aqui estão os principais passos do fluxo de trabalho da GitHub Action para a implantação:

1. **Configuração de Chaves SSH**: Antes da implantação, as chaves SSH são configuradas para permitir o acesso seguro ao servidor EC2 na AWS.

2. **Construção do Container**: O jogo "FangAndFriends" é empacotado em um container Docker, permitindo a portabilidade e a fácil configuração do ambiente.

3. **Envio do Container para o EC2**: O container gerado é enviado para o servidor EC2 na AWS, onde será executado em um ambiente isolado e seguro.

4. **Execução do Jogo**: O container contendo o frontend e o backend é executado no servidor EC2 e estará disponível 
   para os jogadores através do endereço do próprio servidor.

## Como o deploy é realizado

1. Configuramos um servidor EC2 na AWS.
2. Esse repositório "escuta" por novos pushes nos repos do frontend ou no backend.
3. A github action do frontend e do backend geram novas imagens Docker, e as atualizam no DockerHub
4. A github action deste repositório copia o conteúdo deste próprio repositório para uma pasta no servidor.
5. Precisamos fazer o login manualmente via `ssh` no servidor, e executar o script `deploy.sh`, responsável por 
   inicializar os 
   containers 
   através do arquivo `docker-compose.yml`.
6. O Docker Compose baixa as imagens atualizadas e executa os containers no servidor.
7. O jogo fica disponível no endereço IP ou DNS do próprio servidor.
