// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract AccessControl {
    address public owner;
    address public libarian;
    uint256 public book;
    
    constructor(){
        owner = msg.sender;
        book = 0;
    }
    
    modifier onlyLibrarian {
        require(msg.sender == libarian);
        _;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier authorized {
        require(msg.sender == owner || msg.sender == libarian);
        _;
    }

    function appointLibrarian(address _libAddress) public onlyOwner {
        libarian = _libAddress;
    }
    
    function setUpLibrary() public onlyLibrarian {
        book++;
    }

    function bookCount() view public returns(uint256) {
        return book;
    }
}
