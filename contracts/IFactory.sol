// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import './MarketPlace.sol';

interface IFactory {
    // event VotingCloneCreated(address indexed creator, Voting indexed newVoting);

    function createMarketClone(string memory _storeName) external returns (MarketPlace newStore_);
    
    // function getVotingCloneCount() external view returns (uint256);

    function getMarketClones() external view returns (MarketPlace[] memory);
}