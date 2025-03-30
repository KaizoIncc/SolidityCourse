// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // Solidity compiler version 0.8.x

contract SimpleStorage {
    /*
     * Basic types: boolean, uint, int, address, bytes
     * bool hasFavoriteNumber = true;
     * uint256 favoriteNumber = 88; (uint == uint256)
     * int256 favoriteNumber = -88;
     * string favoriteNumberInText = "eighty-eight";
     * address myAddress = 0x328695d666539971d4Bd76501c463Fd1D07bD5c7;
     * bytes32 favoritesBytes32 = "cat"; (bytes != bytes32)
    */

    uint256 MyfavoriteNumber; // visibilidad de los datos: public (es como un getter), private, internal (valor predeterminado), external (solo para funciones)
    
    // uint256[] listOfFavoriteNumbers; [] declaración de array dinammico
    // uint256[3] listOfFavoriteNumbers; [] declaración de array statico de tamaño 3
    struct Person { // Estructura de datos
        uint256 favoriteNumber;
        string name;
    }

    // Asignar un valor a una variable de tipo Person. 
    // Para ser mas explícitos, se puede declarar {}: Person({favoriteNumber: 10 , name: "Ana"})
    // Person public Ana = Person(10 , "Ana");

    Person[] public listOfPeople; // [] Declaración de array de Person

    mapping(string => uint256) public nametoFavoriteNumber; // Declaración de mapping (variable => valor) (Nota: Es como un diccionario)

    function store(uint256 _favoriteNumber) public {
        MyfavoriteNumber = _favoriteNumber;
    }

    // view = No permite actualizar el estado de la BlockChain, sólo la lee (puede leer variables de almacenamiento)
    // pure = No permite actualizar el estado de la BlockChain, sólo la lee (no puede leer variables de almacenamiento)
    // Ambos modificadores evitan que una función consuma gas cuando es llamada externamente. Sin embargo, 
    // si una función sin view ni pure llama a una función que sí tiene view o pure, esta última sí consumirá gas.

    function retrieve() public view returns(uint256) {
        return MyfavoriteNumber;
    }

    // memory = Variable temporal en memoria que puede ser modificado
    // calldata = Variable temporal en memoria que no puede ser modificado
    // storage = Variable permanente que puede ser modificado

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // Person memory newPerson = Person(_favoriteNumber, _name);
        // listOfPeople.push(newPerson);
        listOfPeople.push(Person(_favoriteNumber, _name));
        nametoFavoriteNumber[_name] = _favoriteNumber;
    }
}
