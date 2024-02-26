import { ethers } from "hardhat";

async function main() {
  
  const marketFactory = await ethers.deployContract("MarketFactory" );

  await marketFactory.waitForDeployment();

  console.log(
    `MarketFactory deployed to ${marketFactory.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
