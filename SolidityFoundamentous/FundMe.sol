// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

error notOwner(); // <- Reduce costos de gas comparado con require() y revierte 

contract FundMe {
    using PriceConverter for uint256;

    // constant = se asigna en el código y nunca cambia
    uint256 public constant MINIMUM_USD = 5e18; // $5
    
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    // immutable = se asigna una vez en el constructor y tampoco cambia después
    address public immutable i_owner;

    // constructor es una función especial que se ejecuta una única vez cuando se despliega el contrato
    constructor() {
        i_owner = msg.sender;
    }

    // payable = Hace que la función gaste dinero
    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "No se puede gastar menos de 1 ETH");
        // require(getConversionRate(msg.value) >= minimumUSD, "No se puede gastar menos de 1 ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function withdraw() public onlyOwner {
        
        for(uint256 funderIndex = 0; funderIndex < funders.length; ++funderIndex) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // reset el array
        funders = new address[](0);

        // transfer (gasta 2300 gas)
        // msg.sender = address
        // payable(msg.sender) = payable address (hay que trabajar con payable address)
        // payable(msg.sender).transfer(address(this).balance);
        // send (gasta 2300 gas y devuelve bool)
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //require(sendSuccess, "Send failed");
        // call (recomendado)
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    // modifier es una forma de reutilizar lógica que normalmente se usa para verificar condiciones antes de ejecutar una función.
    modifier onlyOwner {
        // require(msg.sender == i_owner, "Only Owner");
        if(msg.sender != i_owner) revert notOwner();
        _; // <- es un placeholder que representa dónde se insertará el cuerpo de la función que está usando el modifier
    }

    // receive() = se ejecuta cuando el contrato recibe ETH sin datos. (debe estar en external payable)
    receive() external payable {
        fund();
    }

    // fallback() se ejecuta cuando el contrato recibe datos o llama a una función que no existe. (debe estar en external payable)
    fallback() external payable {
        fund();
    }
}
