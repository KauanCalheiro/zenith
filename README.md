# Zenith

## Pré-requisitos

Antes de começar, você precisará ter instalado:

- [Git](https://git-scm.com/downloads)
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Clonando o repositório

Para clonar o repositório corretamente, incluindo todos os submódulos, execute o seguinte comando:

```bash
git clone --recurse-submodules https://github.com/KauanCalheiro/zenith.git
```

Se você já clonou o repositório sem os submódulos, você pode inicializá-los com:

```bash
git submodule update --init --recursive
```

## Executando o projeto

Para rodar o projeto, utilize o comando:

```bash
docker-compose up
```

Esse comando irá construir e iniciar todos os serviços definidos no arquivo `docker-compose.yml`.

## Atualizando o repositório

Para puxar as últimas atualizações do repositório principal e dos submódulos, utilize os seguintes comandos:

```bash
git pull
git submodule update --recursive
```