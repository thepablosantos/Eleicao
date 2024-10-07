// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract SistemaDeVotacao {

    // Estrutura para armazenar informações sobre candidatos
    struct Candidato {
        string nome;
        uint votos;
    }

    // Mapeamento de candidatos (identificados por um índice)
    Candidato[] public candidatos;

    // Mapeamento para rastrear se um endereço já votou
    mapping(address => bool) public jaVotou;

    // Endereço do proprietário do contrato
    address public owner;

    // Construtor
    constructor() {
        owner = msg.sender; // O proprietário é quem implanta o contrato
    }

    // Modificador para restringir o acesso ao proprietário
    modifier apenasProprietario() {
        require(msg.sender == owner, "Apenas o proprietario pode registrar candidatos");
        _;
    }

    // Função para registrar um novo candidato
    function registrarCandidato(string memory _nome) public apenasProprietario {
        candidatos.push(Candidato(_nome, 0));
    }

    // Função para votar em um candidato
    function votar(uint _indice) public {
        require(!jaVotou[msg.sender], "Voce ja votou");
        require(_indice < candidatos.length, "Candidato invalido");

        jaVotou[msg.sender] = true; // Marca que o eleitor já votou
        candidatos[_indice].votos++; // Adiciona um voto ao candidato
    }

    // Função para visualizar os resultados da votação
    function resultados() public view returns (string memory vencedor, uint votos) {
        uint maiorVotos = 0;
        uint indiceVencedor;

        for (uint i = 0; i < candidatos.length; i++) {
            if (candidatos[i].votos > maiorVotos) {
                maiorVotos = candidatos[i].votos;
                indiceVencedor = i;
            }
        }

        return (candidatos[indiceVencedor].nome, maiorVotos);
    }
}