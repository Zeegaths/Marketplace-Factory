import { ethers } from "hardhat";
import { MarketFactory } from "../typechain-types";

async function main() {
    const marketFactory = "0x50f5A166515C9ed2c82AF0FF148B3CC2E8FcA353";
    const MARKETFACTORY = await ethers.getContractAt("IFactory", marketFactory);

    const createCloneTx = await MARKETFACTORY. createMarketClone("Abadek");

    await createCloneTx.wait();

    const clones = await MARKETFACTORY.getMarketClones();
    console.log(clones);
    
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });


  // Transaction Hash: 0x3a87a60f32d28919533ac085676203724d14b32be906de62dcbf8b48b6dd3a3c

  // Result(1) [ '0x4FaBa3D65488431496896E3354Ef7e654f5C2910' ]
  