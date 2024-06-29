# DOCKER - ELASTIC

Cria um cluster Elastic Single-Node com SSL configurado, Kibana e Fleet Server para testes locais.

## Como Funciona

O arquivo `docker-compose.yml` executa 6 containers, sendo que 3 são utilizados para setup e 3 são dos serviços.

Os containers usados para setup são:

- `certs`: cria todos os certificados necessários para o cluster, executa uma vez e cria o arquivo `certs.exist` no diretório `certs`.
- `setup_kibana`: faz o setup do usuario `kibana_system`, executa uma vez e cria o arquivo `kibana_user.exist` no diretório `certs`.
- `setup_fleet`: faz o setup do fleet server adicionando o fleet server criado como default e ajustando o output default, executa uma vez e cria o arquivo `fleet_setup.exist` no diretório `certs`.

Os containers com serviços são:

- `elasticsearch`: container rodando o elasticsearch, acessível na porta `9200`
- `kibana`: container rodando o kibana, acessível na porta `5601`
- `fleet`: container rodando o fleet server, acessível na porta `8220`

Para o fleet server são criadas duas políticas padrão:

- `fleet-server-policy`: política para o fleet server.
- `agent-policy`: política genérica para agentes externos, rodando em VMs por exemplo.

As integrações para teste podem ser adicionadas na política `fleet-server-policy` se não houver uma VM executando outro agente.

## Como Utilizar

### Configuração do cluster

Criar um arquivo `.env` com o seguinte conteúdo:

```
# senha para o usuario elastic, no minimo 6 caracteres
ELASTIC_PASSWORD="changeme"

# senha para o usuario kibana_system, no minimo 6 caracteres
KIBANA_PASSWORD="changeme"

# versão da stack, ex: 8.14.1
STACK_VERSION=8.14.1

# nome do cluster
CLUSTER_NAME=siem-docker

# tipo de licença
LICENSE=basic

# porta para o elasticsearch
ES_PORT=9200

# porta para o kibana
KIBANA_PORT=5601

# encryption key para o kibana
XPACK_ENCRYPTEDSAVEDOBJECTS_ENCRYPTIONKEY="random-32-characteres-string"

# porta para o fleet server
FLEET_PORT=8220

# limite de memória se necessário
#MEM_LIMIT=1073741824

```

A variável `XPACK_ENCRYPTEDSAVEDOBJECTS_ENCRYPTIONKEY` precisa conter um valor aleatório de pelo menos 32 caracteres.

O código python abaixo pode ser usado para gerar essa string

```python
import uuid
uuid.uuid4().hex
```

### Iniciando o cluster

Após a criação do arquivo `.env` podemos iniciar o cluster usando o comando a seguir:

```bash
docker compose up -d
```
