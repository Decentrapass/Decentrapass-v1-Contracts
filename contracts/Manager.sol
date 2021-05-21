// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Manager {
    // Stores the user > list of objects > ipfs hash
    mapping(address => mapping(uint256  => Item)) public objects;

    // Stores the number of objects a user has
    mapping(address => uint) public numObjects;

    // Stores the cyphered password
    mapping(address => string) public password;

    // Object
    struct Item {
        uint objectType;
        string hash;
    }

    function saveObject(uint _objectType, uint _id, string memory _hash) public {
        objects[msg.sender][_id] = Item(_objectType, _hash);
        numObjects[msg.sender]++;
    }

    function deleteObject(uint id) public {
        delete objects[msg.sender][id];
    }

    function editObject(uint id, string memory _hash) public {
        objects[msg.sender][id].hash = _hash;
    }
    
    function setPass(string memory cypher) public {
        require(bytes(password[msg.sender]).length == 0);
        password[msg.sender] = cypher;
    }
}