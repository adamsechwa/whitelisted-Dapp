const { ethers } = require("hardhat");

async function main() {
  /**
   * A ContractFactory in ethers.js is an abstration used to devploy new smart contracts,
   * so whitelistContract here is a factory for instances of our Whitelistecontract.
   */

  const whitelistContract = await ethers.getContractFactory("Whitelist");

  //here we deploy the contract
  const deployedWhitelistContract= await whitelistContract.deploy(10);
  // 10 is the Maximum number of whitelisted adress allowed

  //Wait for it to finish deploying
  await deployedWhitelistContract.deployed();

  //print the address of the deployed contract
  console.log(
    "WhitelistContactAddress:",
    deployedWhitelistContract.address
  );
}

//Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })