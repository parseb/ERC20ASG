// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ERC20ASG.sol";



contract GMinitTest is Test, Stage {
    IERC20ASG iGM;

    function setUp() public {
        
    }

    function testIsInit() public {
        assertTrue(address(iGM).code.length > 0, "codesize is 0");
    }

    function testInitPrice(uint256 p_) public {
        vm.assume(p_ > 0);
        address[] memory beneficiaries = new address[](1);
        uint256[] memory amounts = new uint256[](1);

        beneficiaries[0] = address(1337);
        amounts[0] = 100 ether;
        address instance = address( new ERC20ASG("ERC20 Algo Stable Price Linear Up Only Coin", "ASG", 3,1, beneficiaries, amounts));
        iGM = IERC20ASG(instance);

    }

}