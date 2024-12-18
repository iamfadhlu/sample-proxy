// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";

contract DeployAndUpgradeTest is Test{
    DeployBox deployer;
    UpgradeBox upgrader;
    address public proxy;
    address public OWNER = makeAddr("OWNER");

    function setUp() public {
        upgrader = new UpgradeBox();
        deployer = new DeployBox();
        proxy = deployer.run();
    }

    function testUpgrades() public {
        BoxV2 boxV2 = new BoxV2();

        upgrader.upgradeBox(proxy, address(boxV2));
        
        uint256 expectedValue = 2;

        assertEq(expectedValue, BoxV2(proxy).version());
    }

    function testStartsWithBoxV1() public view {
        uint256 expectedValue = 1;

        assertEq(BoxV1(proxy).version(), expectedValue);
    }
}