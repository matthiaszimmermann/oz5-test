// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Usdc} from "../src/Usdc.sol";

contract UsdcTest is Test {

    string public constant TOKEN_SYMBOL = "USDC";
    string public constant TOKEN_NAME = "USDC - Dummy";
    Usdc public token;

    address public tokenOwner = makeAddr("tokenOwner");
    address public outsider = makeAddr("outsider");

    function setUp() public {
        vm.prank(tokenOwner);
        token = new Usdc(TOKEN_NAME);
    }

    function test_SetUp() public {
        assertTrue(address(token) != address(0), "token address zero");
        assertEq(token.symbol(), TOKEN_SYMBOL, "unexpected token symbol");
        assertEq(token.name(), TOKEN_NAME, "unexpected token name");

        assertEq(token.balanceOf(tokenOwner), token.INITIAL_SUPPLY(), "unexpected initial balance for token owner");
        assertEq(token.balanceOf(outsider), 0, "unexpected initial balance for outsider");
    }

    function testFuzz_Transfer(uint256 amount) public {
        if (amount <= token.INITIAL_SUPPLY()) {
            vm.prank(tokenOwner);
            token.transfer(outsider, amount);

            assertEq(token.balanceOf(tokenOwner), token.INITIAL_SUPPLY() - amount, "unexpected balance for token owner");
            assertEq(token.balanceOf(outsider), amount, "unexpected balance for outsider");
        }
    }
}
