// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "forge-std/Script.sol";
import "../src/Multicall3.sol"; // 确保路径正确

contract DeployMulticall3 is Script {
    function run() external {
        // 从 .env 读取私钥
        uint256 pk = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(pk);
        Multicall3 mc = new Multicall3();
        console2.log("Multicall3 deployed at:", address(mc));
        vm.stopBroadcast();
    }
}

