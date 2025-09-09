// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract SwapToken {
    address public tokenA;
    address public tokenB;

    constructor(address _tokenA, address _tokenB) {
        tokenA = _tokenA;
        tokenB = _tokenB;
    }

    function swapAtoB(uint256 amountA) external {
        require(IERC20(tokenA).transferFrom(msg.sender, address(this), amountA), "Transfer failed");
        uint256 amountB = amountA * 3;
        require(IERC20(tokenB).balanceOf(address(this)) >= amountB, "Insufficient TokenB liquidity");
        require(IERC20(tokenB).transfer(msg.sender, amountB), "TokenB transfer failed");
    }

    function swapBtoA(uint256 amountB) external {
        require(IERC20(tokenB).transferFrom(msg.sender, address(this), amountB), "Transfer failed");
        uint256 amountA = amountB / 3;
        require(IERC20(tokenA).balanceOf(address(this)) >= amountA, "Insufficient TokenA liquidity");
        require(IERC20(tokenA).transfer(msg.sender, amountA), "TokenA transfer failed");
    }
}