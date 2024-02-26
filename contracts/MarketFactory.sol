// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import './MarketPlace.sol';

contract MarketFactory {
    
    MarketPlace[] marketPlaces;

    function createMarketClone(string  memory _storeName) external returns(MarketPlace newStore_, uint256 length_) {
        newStore_ = new MarketPlace(_storeName);

        marketPlaces.push(newStore_);

        length_ = marketPlaces.length;

    }

    function getMarketClones() external view returns(MarketPlace[] memory) {
        return marketPlaces;
    }
}