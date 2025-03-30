// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    
    // override = Permite modificar el funcionamiento de una funcion del contract padre que tiene la keyword virtual
    function store(uint256 _newNumber) public override {
        MyfavoriteNumber = _newNumber + 5;
    }
}
