// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title ERC20 Token Smart contract
 * @notice This is simple ERC20 token smart contract with `mint` and `burn` token functionalities
 * @dev This smart contract adds the `mint` and `burn` functions to the ERC20 token standard and has a maximum supply of ` 100e18`
 */

contract Token is ERC20 {
    // State Variables
    address public immutable owner;
    uint256 public constant MAXIMUM_SUPPLY = 100e18; // 100_000_000_000_000_000_000

    // Custom Errors
    error NotOwner();
    error CannotMintMorethanMaximumSupply();
    error InsufficientBalance();

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    constructor() ERC20("Token", "MET") {
        owner = msg.sender;
        _mint(msg.sender, 1e18); // 1_000_000_000_000_000_000
    }

    function mint(address _to, uint _amount) public onlyOwner {
        // checks that amount is not morethan maximum supply
        if (_amount >= MAXIMUM_SUPPLY) revert CannotMintMorethanMaximumSupply();
        _mint(_to, _amount * 3e18);
    }

    function burn(uint _amount) public {
        // checks that balance is not greater that amount
        if (balanceOf(msg.sender) < _amount) revert InsufficientBalance();
        _burn(msg.sender, _amount);
    }

    function transfer(
        address to,
        uint256 value
    ) public virtual override returns (bool success) {
        require(balanceOf(msg.sender) >= value, "Insufficient balance");
        success = super.transfer(to, value);
    }
}
