// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title CoreNameService - A simple ENS-like name system on Core chain
contract CoreNameService {
    mapping(string => address) public names;
    mapping(address => string) public reverse;

    function register(string memory name) public {
        require(names[name] == address(0), "Name already registered");
        names[name] = msg.sender;
        reverse[msg.sender] = name;
    }

    function resolve(string memory name) public view returns (address) {
        return names[name];
    }

    function reverseLookup(address user) public view returns (string memory) {
        return reverse[user];
    }
}
