const main = async () => {
    const [deployer] = await hre.ethers.getSigners();
    const accountBalance = await deployer.getBalance();
    console.log("Deploying contracts with account: ", deployer.address);
    console.log("Account balance: ", accountBalance.toString());

    const detailsContractFactory = await hre.ethers.getContractFactory("DetailsContract");
    const detailsContract = await detailsContractFactory.deploy();
    await detailsContract.deployed();

    console.log("DetailsContract address: ", detailsContract.address);
};
const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};
runMain();