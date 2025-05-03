// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Bank {
    uint256 public balance;
    string public name;

    struct Account {
        uint256 balance;
        string name;
    }

    Account public account1;

    constructor() {
        account1 = Account(250, "Account 1");
    }

    function deposit(uint256 setValue) public {
        require(setValue > 0, "Deposit amount must be greater than zero");
        uint256 newValue = account1.balance + setValue;
        account1 = Account(newValue, "Account 1");
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(account1.balance >= amount, "Insufficient balance");
        account1.balance -= amount;
    }
    function getBalance() public view returns (uint256) {
        return account1.balance;
    }
}