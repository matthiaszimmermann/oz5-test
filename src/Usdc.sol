// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Usdc is ERC20 {

    string public constant SYMBOL = "USDC";
    uint8 public constant DECIMALS = 6;

    uint256 public constant INITIAL_SUPPLY = 10**24;

    constructor(string memory name)
        ERC20(name, SYMBOL)
    {
        require(bytes(name).length > 0, "ERROR:USD-001:NAME_EMPTY");

        _mint(
            _msgSender(),
            INITIAL_SUPPLY
        );
    }

    function decimals() public pure override returns(uint8) {
        return DECIMALS;
    }
}
