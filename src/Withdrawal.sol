// SPDX-License-Identifier: UNLICENSED
//Withdrawal pattern
// - you are sending ether/token to multiple accounts
// - you want to avoid paying transaction fee as the initiator of
// the transaction pays the fees.
pragma solidity ^0.8.17;

contract Withdrawal {
    mapping(address => uint256) internal balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    //Good practice
    function claimDividend() public {
        uint amount = balances[msg.sender];
        require (amount > 0, "No dividends to claim");
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount); //pull ether from the contract
    }
}
