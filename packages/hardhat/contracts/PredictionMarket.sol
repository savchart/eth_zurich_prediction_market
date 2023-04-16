// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@api3/contracts/v0.8/interfaces/IProxy.sol";
import "https://github.com/gelatodigital/automate/blob/master/contracts/integrations/AutomateReady.sol";

contract PredictionMarket is Ownable, AutomateReady {
    // Store market details
    struct Market {
        string description;
        uint256 endTime;
        bool finalized;
        uint256 yesVotes;
        uint256 noVotes;
    }

    Market[] public markets;
    mapping(uint256 => mapping(address => uint256)) public yesVotes;
    mapping(uint256 => mapping(address => uint256)) public noVotes;

    address public proxy;

    constructor(address _automate, address _taskCreator) AutomateReady(_automate, _taskCreator) {}

    function setProxy(address _proxy) public onlyOwner {
        proxy = _proxy;
    }

    function createMarket(string memory _description, uint256 _endTime) public onlyOwner {
        require(_endTime > block.timestamp, "End time must be in the future.");
        markets.push(Market({
            description: _description,
            endTime: _endTime,
            finalized: false,
            yesVotes: 0,
            noVotes: 0
        }));
    }

    function voteYes(uint256 _marketId, uint256 _amount) public {
        require(_marketId < markets.length, "Invalid market ID.");
        require(block.timestamp < markets[_marketId].endTime, "Market has ended.");
        yesVotes[_marketId][msg.sender] += _amount;
        markets[_marketId].yesVotes += _amount;
    }

    function voteNo(uint256 _marketId, uint256 _amount) public {
        require(_marketId < markets.length, "Invalid market ID.");
        require(block.timestamp < markets[_marketId].endTime, "Market has ended.");
        noVotes[_marketId][msg.sender] += _amount;
        markets[_marketId].noVotes += _amount;
    }

    function finalizeMarket(uint256 _marketId) public onlyOwner {
        require(_marketId < markets.length, "Invalid market ID.");
        require(block.timestamp > markets[_marketId].endTime, "Market has not ended.");
        require(!markets[_marketId].finalized, "Market is already finalized.");
        markets[_marketId].finalized = true;
    }

    function readDataFeed()
        external
        view
        returns (int224 value, uint256 timestamp)
    {
        (value, timestamp) = IProxy(proxy).read();
    }

    receive() external payable {}

    function withdrawFunds() onlyOwner external returns (bool success) {
        (success,) = payable(msg.sender).call{value: address(this).balance}("");
    }
}
