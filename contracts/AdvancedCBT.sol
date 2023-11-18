pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

import "./CurveBondedToken.sol";
import "./Ownable.sol";

contract AdvancedCBT is CurveBondedToken, Ownable {
    function () public { revert(); }

    event Mint(address, uint);
    event Burn(address, uint);

    function mint() public payable {
        uint amount = _curvedMint(tx.value);
        emit Mint(tx.origin, amount);
    }

    function burn(uint256 _amount, address to) public payable onlyOwner {
        uint256 reimbursement = _curvedBurn(_amount);
        payable(to).transfer(reimbursement);
        emit Burn(to, reimbursement);
    }
}
