// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Bank {
    uint256 public balance;
    string public name;

    struct Account {
        uint256 balance;
        string name;
    }

    mapping(address => Account) public accounts;
    mapping(address => uint256) public balances;

    Account public account1;

    constructor() {
        account1 = Account(250, "Account 1");
    }

    function deposit(uint256 setValue) public {
        require(setValue > 0, "Deposit amount must be greater than zero");
        account1 = Account(setValue, "Account 1");
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
    }
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}