// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 SEND_VALUE = 0.1e18;

    function fundFundMe(address mostRecentFundMe) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentFundMe)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded FundMe with: %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentFundMe = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );

        fundFundMe(mostRecentFundMe);
    }
}

contract WithdrawFundMe is Script {
    function withdrawFundMe(address mostRecentFundMe) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentFundMe)).withdraw();
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentFundMe = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );

        WithdrawFundMe(mostRecentFundMe);
    }
}
