// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract SimpleMintContract is ERC721URIStorage, Ownable {
    
    uint256 public mintAmount = 0.05 ether; // -> Users must pay 0.05 ETH to mint an NFT
    uint256 public totalSupply;
    uint256 public maxSupply;               // -> Supply limitation
    bool public isMintEnabled;

    mapping(address => uint256) public mintedWallets;

    // Constructor to set initial values and pass the owner
    constructor() ERC721("Sample Minting", "SAMPLEMINT") Ownable(msg.sender) {
        maxSupply = 2;
    }

    function toggleIsMintEnabled() external onlyOwner {
        isMintEnabled = !isMintEnabled;
    }

    function setmaxsupply(uint maxSupply_) external onlyOwner {
        maxSupply = maxSupply_; // -> Supply limitation
    }

    function mint() external payable {
        require(isMintEnabled, "Minting not enabled");
        require(mintedWallets[msg.sender] < 1, "Exceeds max per wallet");
        require(msg.value == mintAmount, "Wrong value");
        require(maxSupply > totalSupply, "Sold out");

        mintedWallets[msg.sender]++;
        totalSupply++;

        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
    }
}