// SPDX-License-Identifier: MIT

//Goal-Deploy one contract from another contract

pragma solidity ^0.6.0;

// SimpleStorage contract is deployed by StorageFactory contract...For that we need to import SimpleStorage contract here.
import "./SimpleStorage.sol";

contract StorageFactory is
    SimpleStorage //StorageFactory inherited all the variables and functions from SimpleStorage
{
    SimpleStorage[] public simpleStorageArray; //array

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage(); //simpleStorage is the object that was created which belongs to the class type of SimpleStorage
        simpleStorageArray.push(simpleStorage);
    }

    //    in order to interact wiht the SimpleStorage contract, we need two things
    // Address
    // ABI-Application Binary Interface
    function sfStore(
        uint256 _simpleStorageIndex,
        uint256 _simpleStorageNumber
    ) public {
        //  stores given _simpleStorageNumber ot the respective simplestorage object in the array by using _simpleStorageIndex
        SimpleStorage simpleStorage = SimpleStorage(
            address(simpleStorageArray[_simpleStorageIndex])
        ); //fetched required simplestorage contract using address
        simpleStorage.store(_simpleStorageNumber);

        //above two lines can be written as single line also
        // SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber)
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage simpleStorage = SimpleStorage(
            address(simpleStorageArray[_simpleStorageIndex])
        );
        return simpleStorage.retrive();

        //above two lines can be written as single line also
        // return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrive();
    }
}
