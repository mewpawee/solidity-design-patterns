pragma solidity ^0.8.10;

interface Interface {
    function appointLibrarian(address _libAddress) external;
    function book() external view returns (uint256);
    function bookCount() external view returns (uint256);
    function libarian() external view returns (address);
    function owner() external view returns (address);
    function setUpLibrary() external;
}

