// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import { console } from "forge-std/console.sol";
import "../src/AccessControl.sol";

contract AccessControlTest is Test {
    address internal constant LIBARIAN = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;

    AccessControl public accessControl;
    function setUp() public {
        accessControl = new AccessControl();
        accessControl.appointLibrarian(LIBARIAN);
        address currentLibarian = accessControl.libarian();
    }

    //Deposit then withdraw the fund
    // function testAppointLibrarian() public {
    //     assertEq(currentLibarian, LIBARIAN);
    // }
    
    function testSetupTheLibrary() public {
        startHoax(LIBARIAN);
        accessControl.setUpLibrary();
        console.log("Book Count: ", accessControl.book());
    }

}
