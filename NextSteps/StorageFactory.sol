// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol"; // Forma de importar un solo contrato de un .sol
// import "./SimpleStorage.sol"; Importa todo el documento

contract StorageFactory {
    
    SimpleStorage[] public listOfSimpleStorage;

    function createSimpleStorageContract() public {
        SimpleStorage newsimpleStorageContract = new SimpleStorage();
        listOfSimpleStorage.push(newsimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        listOfSimpleStorage[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return listOfSimpleStorage[_simpleStorageIndex].retrieve();
    }
}
