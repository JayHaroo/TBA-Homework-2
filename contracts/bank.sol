// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Bank {
    struct Account {
        uint256 balance;
        string name;
    }

    mapping(address => Account) public accounts;

    constructor() {
        // Optionally set an initial account for the deployer
        accounts[msg.sender] = Account(250, "Default Account");
    }

    function deposit(uint256 setValue) public {
        require(setValue > 0, "Deposit amount must be greater than zero");
        accounts[msg.sender].balance += setValue;

        // If no name is set, assign a default name
        if (bytes(accounts[msg.sender].name).length == 0) {
            accounts[msg.sender].name = "Unnamed Account";
        }
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(accounts[msg.sender].balance >= amount, "Insufficient balance");
        accounts[msg.sender].balance -= amount;
    }

    function getBalance() public view returns (uint256) {
        return accounts[msg.sender].balance;
    }

    function setName(string calldata _name) public {
        accounts[msg.sender].name = _name;
    }

    function getAccount() public view returns (Account memory) {
        return accounts[msg.sender];
    }
}
