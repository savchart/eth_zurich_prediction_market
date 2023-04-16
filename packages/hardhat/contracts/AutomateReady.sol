// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract AutomateReady is Ownable {
    using SafeERC20 for IERC20;

    // Address of the Automate contract
    address public automate;

    // Address of the TaskCreator contract
    address public taskCreator;

    constructor(address _automate, address _taskCreator) {
        automate = _automate;
        taskCreator = _taskCreator;
    }

    modifier onlyAutomate() {
        require(
            msg.sender == automate,
            "AutomateReady: Only Automate contract can call this function"
        );
        _;
    }

    modifier onlyDedicatedMsgSender() {
        require(
            msg.sender == address(this),
            "AutomateReady: Only dedicated msg.sender can call this function"
        );
        _;
    }

    function _getFeeDetails()
        internal
        view
        returns (uint256 fee, address feeToken)
    {
        (fee, feeToken) = IAutomate(automate).getFeeDetails();
    }

    function _transfer(uint256 _fee, address _feeToken) internal {
        IERC20(_feeToken).safeTransferFrom(msg.sender, automate, _fee);
    }
}

interface IAutomate {
    function getFeeDetails()
        external
        view
        returns (uint256 fee, address feeToken);
}
