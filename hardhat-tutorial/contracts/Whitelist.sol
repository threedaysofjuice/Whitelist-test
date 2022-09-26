// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist{

    uint8 public maxWhitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    mapping(address => bool) public WhitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {

        require(!WhitelistedAddresses[msg.sender], "Sender already in the whitelist");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max limit reached");
        WhitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}