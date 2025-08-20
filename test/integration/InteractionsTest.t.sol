// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract InteractionTest is Test {
    FundMe fundMe;
    FundFundMe fundFundMe;
    address USER = makeAddr("user");
    uint256 constant SEND_VALUE = 0.1e18;
    uint256 constant START_FUND = 10e18;
    uint256 constant GAS_PRICE = 1;
    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        fundFundMe = new FundFundMe();
        vm.deal(USER, START_FUND);
    }

    function testUserCanFundInterations() public {
        // FundFundMe fundFundMe = new FundFundMe();
        vm.prank(USER);

        fundFundMe.fundFundMe(address(fundMe));

        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        withdrawFundMe.withdrawFundMe(address(fundMe)); 

        assert(address(fundMe).balance == 0);
    }
}