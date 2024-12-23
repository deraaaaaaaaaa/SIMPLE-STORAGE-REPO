// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import { SimpleStorage } from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external {
        // Fetch the private key from environment variables
        string memory privateKeyHex = vm.envString("PRIVATE_KEY");

        // Convert the hex string to uint256 (you can also do more checks here)
        uint256 privateKey = uint256(bytes32(keccak256(bytes(privateKeyHex))));

        // Start broadcasting with the private key
        vm.startBroadcast(privateKey);

        // Deploy the SimpleStorage contract and call the store function
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorage.store(42);

        // Stop broadcasting after deployment
        vm.stopBroadcast();
    }
}
