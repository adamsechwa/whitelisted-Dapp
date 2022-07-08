// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    //Max number of whitelisted address allowed
    uint8 public maxWhitelistedAddresses;

    // create a mapping of whhitelistedAddresses
    //if an address is whitelisted, we would set it to, it is false by defaul for all
    //other address
    mapping(address => bool) public whitelistedAddresses;

    //numAddress whitelisted would be used to keep track of how  many addresses have been whitelisted
    //NOTE: Don't change this variable name, ass it will be part of verification
    uint8 public numAddressesWhitelisted;

    //Setting the Max number of the whitelisted addresses
    //User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses){
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
    addAddressTowhitelist - This function adds the address of the sender to the whitelist
     */

    function addAddressToWhitelist() public {
        //check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been added to the whitelisted");
        // check if the numAddresseswhitelisted < maxWhitelistedAdresses, if not throw an error message
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses caant be added, limit reached");
        //Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}