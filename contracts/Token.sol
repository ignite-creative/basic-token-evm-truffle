// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Token {
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowance;

    string private _name;
    string private _symbol;
    uint8 private _decimals;

    address private _owner;

    uint256 private _totalSupply;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor(
        string memory name_,
        string memory symbol_,
        uint256 amt_,
        uint8 decimals_
    ) {
        _name = name_;
        _symbol = symbol_;
        _totalSupply = amt_;
        _decimals = decimals_;
        _balances[msg.sender] = amt_;
        _owner = msg.sender;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _addr) external view returns (uint256) {
        return _balances[_addr];
    }

    function transfer(address _to, uint256 _amt)
        external
        sufficientGuard(_to, _amt)
    {
        _balances[msg.sender] -= _amt;
        _balances[_to] += _amt;

        emit Transfer(msg.sender, _to, _amt);
    }

    modifier sufficientGuard(address _addr, uint256 _amt) {
        require(_balances[_addr] > _amt, "Insufficent balance");
        _;
    }
}
