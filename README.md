

# Smart Contract Proxy Upgrade Example

This repository demonstrates a smart contract system utilizing proxy patterns for upgradeability with OpenZeppelin's UUPS (Universal Upgradeable Proxy Standard) approach. The system includes contracts for an upgradable `Box` contract, with deployment and upgrade scripts. The goal is to showcase the process of upgrading smart contracts while maintaining state and functionality across versions.

## Project Overview

This project includes the following components:

1. **BoxV1**: The initial version of the `Box` contract that allows reading a stored number.
2. **BoxV2**: The upgraded version of the `Box` contract, which adds the ability to update the stored number.
3. **DeployBox**: A script for deploying the initial `BoxV1` contract behind a proxy.
4. **UpgradeBox**: A script for upgrading the proxy to the `BoxV2` contract.

The contract utilizes OpenZeppelin's `UUPSUpgradeable`, `Initializable`, and `OwnableUpgradeable` libraries, providing upgradeable functionality and ensuring that only the contract owner can perform upgrades.

## Smart Contract Details

### BoxV1

- **BoxV1** allows reading a number, but it doesn't support setting it. The contract is initialized via the `initialize()` function, which uses OpenZeppelin's `Ownable` and `UUPSUpgradeable` to handle initialization and ownership.
  
### BoxV2



- **BoxV2** adds the ability to set the stored number using the `setNumber()` function. This version is designed to be deployed as the upgraded implementation of the proxy.

### DeployBox Script


- The **DeployBox** script deploys the `BoxV1` contract behind an upgradeable proxy. The proxy allows the contract to be upgraded in the future without losing any state.

### UpgradeBox Script


- **UpgradeBox** is responsible for upgrading the proxy to use the `BoxV2` contract. It finds the most recent proxy deployment and calls the `upgradeToAndCall()` function to perform the upgrade.

