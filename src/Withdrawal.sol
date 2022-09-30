// SPDX-License-Identifier: UNLICENSED
//Withdrawal pattern
// - you are sending ether/token to multiple accounts
// - you want to avoid paying transaction fee as the initiator of
// the transaction pays the fees.
pragma solidity ^0.8.17;

contract Withdrawal {
    address[] internal investors;
    mapping(address => uint256) internal balances;

    //function saves an investor address on an array
    function registerInvestor(address _investor) public {
        require(_investor != address(0));
        investors.push(_investor);
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function calculateDividendAccured(address _investor) view internal returns (uint256) {
        return balances[_investor];
    }
    //Good practice
    function claimDividend() public {
        uint amount = calculateDividendAccured(msg.sender);
        require (amount > 0, "No dividends to claim");
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount); //pull ether from the contract
    }
}
