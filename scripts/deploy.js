const hre = require("hardhat");

async function main() {
    // Obtenha o contrato que deseja implantar
    const SistemaDeVotacao = await hre.ethers.getContractFactory("SistemaDeVotacao");
    
    // Defina os nomes iniciais dos candidatos
    const candidatosIniciais = ["Pablo", "Satoshi", "Szabo"];
    
    // Implante o contrato
    const sistemaDeVotacao = await SistemaDeVotacao.deploy(candidatosIniciais);
    
    // Aguarde até que a implantação seja concluída
    await sistemaDeVotacao.deployed();
    
    // Mostre o endereço do contrato implantado
    console.log("Contrato implantado no endereço:", sistemaDeVotacao.address);
}

// Execute o script
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });