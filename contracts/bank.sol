// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Bank {
    string public name;

    struct Account {
        uint256 balance;
        string name;
    }

    Account public account1;
    mapping(address => uint256) public balances;

    constructor() {
        account1 = Account(250, "Account 1");
    }

    function deposit(uint256 setValue) public {
        require(setValue > 0, "Deposit amount must be greater than zero");
        account1.balance += setValue;
        balances[msg.sender] += setValue;
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;

        if (account1.balance >= amount) {
            account1.balance -= amount;
        }
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function getAccount1Balance() public view returns (uint256) {
        return account1.balance;
    }
}
