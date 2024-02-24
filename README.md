# Smart-contract-erc20
### Overview
This Solidity smart contract, named `Token`, implements the ERC20 token standard with additional functionalities for minting and burning tokens. The contract provides a maximum supply limit of 100 million tokens (`100e18`).

### Smart Contract Structure
- **ERC20 Standard**: Extends the OpenZeppelin ERC20 contract to inherit standard ERC20 token functionalities.
- **State Variables**:
  - `owner`: Immutable address representing the owner of the contract.
  - `MAXIMUM_SUPPLY`: Constant defining the maximum supply limit of the token.
- **Custom Errors**:
  - `NotOwner`: Indicates that the sender is not the owner of the contract.
  - `CannotMintMorethanMaximumSupply`: Indicates an attempt to mint tokens exceeding the maximum supply limit.
  - `InsufficientBalance`: Indicates insufficient balance for burning tokens.
- **Modifiers**:
  - `onlyOwner`: Restricts certain functions to be called only by the owner of the contract.
- **Constructor**: Initializes the contract with the token name, symbol, and mints initial tokens to the owner.
- **Functions**:
  - `mint`: Allows the owner to mint new tokens and distribute them to a specified address.
  - `burn`: Allows token holders to burn a specific amount of their tokens.
  - `transfer`: Overrides the ERC20 `transfer` function to include a check for the sender's balance before transferring tokens.

### Usage
1. **Deployment**: Deploy the `Token` contract to the Ethereum blockchain.
2. **Interacting with the Contract**: Users can interact with the contract through various functions:
   - Mint new tokens (accessible only to the owner).
   - Burn tokens.
   - Transfer tokens to other addresses.

### Testing
- Ensure to test all functionalities thoroughly before deploying the contract in a production environment.
- Test different scenarios, including minting, burning, and transferring tokens, to ensure proper functionality and error handling.

### Dependencies
- This contract utilizes the OpenZeppelin library for the ERC20 implementation.

### License
This smart contract is licensed under the MIT License.

### Disclaimer
- This contract is provided as a demonstration and should not be used in production without thorough testing and security audits.
- Users are responsible for any risks associated with interacting with the contract.

--- 

Feel free to customize this README according to your project's requirements, providing additional details or instructions as needed.
