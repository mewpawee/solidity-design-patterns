// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import { console } from "forge-std/console.sol";
import "../src/Withdrawal.sol";

contract WithdrawalTest is Test {
    address internal constant WHALE = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    Withdrawal public withdrawal;
    function setUp() public {
       withdrawal = new Withdrawal();
    }

    //Deposit then withdraw the fund
    function testDepositAndWithdrawal() public {
        startHoax(WHALE);
        uint256 balance = address(WHALE).balance;
        console.log("Initial: ", balance);
        withdrawal.deposit{value: 100000000}();
        withdrawal.claimDividend();
        balance = address(WHALE).balance;
        console.log("Final Balance: ", balance);
    }

}
