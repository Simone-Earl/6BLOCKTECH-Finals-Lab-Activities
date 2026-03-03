// SPDX-License-Identifier: MIT
// 1. Set pragma and semver
pragma solidity ^0.8.20;

// 2. Open the zeppelin ERC20 and ERC4626 extensions
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// 3. Create a contract named SimpleGoldVault aligned with ERC 4626
contract SimpleGoldVault is ERC4626 {
    
    // 4. Create a constructor. The constructor takes the address of the Underlying Asset
    constructor(IERC20 asset) ERC4626(asset) ERC20("Vault Gold", "vGLD") {
        // Vault initialization is handled by the OpenZeppelin parent contracts
    }
}