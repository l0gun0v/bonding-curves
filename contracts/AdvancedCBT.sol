pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

import "./CurveBondedToken.sol";

contract AdvancedCBT is CurveBondedToken {
    function () public { revert(); }

    function mint() public payable {
        _curvedMint(tx.value);
    }

    function burn(uint256 _amount) public payable {
        uint256 reimbursement = _curvedBurn(_amount);
        payable(tx.origin).transfer(reimbursement);
    }
}
