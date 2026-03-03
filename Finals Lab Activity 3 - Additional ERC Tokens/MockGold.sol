// SPDX-License-Identifier: MIT
// 1. Set pragma and semver
pragma solidity ^0.8.20;

// 2. Open the zeppelin ERC20
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 5. Create another contract and constructor for ERC20
contract MockGold is ERC20 {
    constructor() ERC20("Gold Token", "GLD") {
        // Mint initial tokens to the deployer for testing
        _mint(msg.sender, 10000 * 10 ** decimals()); 
    }
}