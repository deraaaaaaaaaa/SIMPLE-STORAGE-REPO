// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import "forge-std/Test.sol";
import "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage private simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }

    function testStoreFavoriteNumber() public {
        uint256 testNumber = 42;
        simpleStorage.store(testNumber);

        uint256 retrievedNumber = simpleStorage.retrieve();
        assertEq(retrievedNumber, testNumber, "Stored number does not match retrieved number");
    }

    function testAddPerson() public {
        string memory name = "Alice";
        uint256 favoriteNumber = 77;

        simpleStorage.addPerson(name, favoriteNumber);

        (uint256 storedFavoriteNumber, string memory storedName) = simpleStorage.listOfPeople(0);
        assertEq(storedFavoriteNumber, favoriteNumber, "Favorite number does not match");
        assertEq(storedName, name, "Name does not match");

        uint256 mappedNumber = simpleStorage.nameToFavoriteNumber(name);
        assertEq(mappedNumber, favoriteNumber, "Mapping for name to favorite number is incorrect");
    }

    function testRetrieveDefaultValue() public {
        uint256 defaultValue = simpleStorage.retrieve();
        assertEq(defaultValue, 0, "Default value of favorite number should be 0");
    }
}
