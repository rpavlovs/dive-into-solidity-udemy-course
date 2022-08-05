//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    receive() external payable {
        // Do nothing
    }

    fallback() external payable {
        // Do nothing
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function transferAll(address payable _to) public onlyOwner {
        uint balance = address(this).balance;
        (bool success, bytes memory returnBytes) = _to.call{value: balance}('');
        (success, returnBytes);
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string calldata a, string calldata b) public pure returns (string memory) {
        string memory ab = string.concat(a, b);
        return ab;
    }
}
