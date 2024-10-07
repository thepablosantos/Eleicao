# Sistema de Registro de Votação

Este contrato implementa um sistema de votação baseado em blockchain, permitindo registrar candidatos e contabilizar votos de forma transparente e segura. O contrato é desenvolvido em Solidity e garante que apenas o proprietário possa registrar novos candidatos, enquanto qualquer endereço pode votar, desde que não tenha votado anteriormente.

## Funcionalidades

- **Registro de Candidatos**: O proprietário do contrato pode adicionar novos candidatos com um nome, começando com zero votos.
- **Votação**: Usuários podem votar em candidatos registrados, assegurando que cada endereço possa votar apenas uma vez.
- **Resultados da Votação**: Função para visualizar o candidato vencedor, mostrando o nome e o número total de votos recebidos.
- **Modificadores de Acesso**: Utilização de modificadores para restringir o acesso a funções sensíveis, como o registro de candidatos.

## Estrutura do Contrato

- **Candidatos**: Cada candidato é representado por um nome e um contador de votos.
- **Acesso ao Proprietário**: O proprietário do contrato é definido no momento da implantação e é responsável por gerenciar o registro de candidatos.
- **Mecanismo de Votação**: Implementação de um sistema que assegura que um eleitor não vote mais de uma vez.

## Instalação e Uso

**Ferramenta**: Hardhat
**Ferramenta**: MetaMask

### Pré-requisitos

- [Node.js](https://nodejs.org/) e npm instalados.
- [Truffle](https://www.trufflesuite.com/truffle) ou [Hardhat](https://hardhat.org/) para desenvolvimento e teste.
- Uma carteira Ethereum (como MetaMask) configurada.

### Passos para Implantação

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu_usuario/sistema-de-votacao.git
   cd sistema-de-votacao
   ```

2. Instale as dependências:
   ```bash
   npm install
   ```

3. Inicie o Hardhat

```npx hardhat```

## Escolha a opção “Create a basic sample project” para configurar um projeto básico.

4.	Compile o contrato:

```npx hardhat compile```

5.	Implante o contrato:

```npx hardhat run scripts/deploy.js --network localhost```

6.	Interaja com o contrato:

1.	Registrar Candidatos:
## Use a função registrarCandidato passando o nome do candidato como parâmetro.

```
await sistemaDeVotacao.registrarCandidato("Alice");
```

2.	Votar em um Candidato:
## Use a função votar passando o índice do candidato como parâmetro.

```
await sistemaDeVotacao.votar(0);
```

3.	Visualizar Resultados:
## Chame a função resultados para obter o vencedor.

```
const [vencedor, votos] = await sistemaDeVotacao.resultados();
```

Licença

Este projeto está licenciado sob a Licença MIT