// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyMultiToken is ERC1155, Ownable {

    // Token IDs
    uint256 public constant GOLD = 1;
    uint256 public constant SILVER = 2;
    uint256 public constant DIAMOND = 3;

    // Constructor to pass arguments to ERC1155 and Ownable base contracts
    constructor() ERC1155("https://mygame.io/api/item/{id}.json") Ownable(msg.sender) {
        // Mint some tokens for the contract owner at deployment
        _mint(msg.sender, GOLD, 1000, "");
        _mint(msg.sender, SILVER, 5000, "");
        _mint(msg.sender, DIAMOND, 100, "");
    }

    // Function to mint new tokens (only owner can call this)
    function mint(
        address to,
        uint256 id,
        uint256 amount
    ) external onlyOwner {
        _mint(to, id, amount, "");
    }

    // Function to burn tokens (only token holder can burn)
    function burn(
        address from,
        uint256 id,
        uint256 amount
    ) external {
        require(from == msg.sender, "You can only burn your own tokens");
        _burn(from, id, amount);
    }
}