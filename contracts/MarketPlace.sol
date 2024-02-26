// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


contract MarketPlace {

    uint256 itemCount;
    string storeName;
    address owner;

    //item properties
    struct Item{
        uint256 Id;
        string name;
        uint256 price;
    }

    Item[] itemsArray;

//mapping to check if an item is purchased
    mapping(uint =>  bool) purchased;
    mapping(uint256 => Item) Items;


    constructor(string memory _name) {
        storeName = _name;
        owner = msg.sender;
    }

//add new items to the store
    function addItimes(string memory _name, uint256 _price) external {
        //only owner can add items
        require(msg.sender == owner ,"you are not the owner");

         uint256 _sId = itemCount + 1;

         Item storage newItem = Items[_sId];

         newItem.Id = _sId;
         newItem.name = _name;
         newItem.price = _price;

//push the item to the array
         itemsArray.push(newItem);

         itemCount = itemCount + 1;

    }

//buy a listed item
    function purchaseItem(uint256 _itemId) external payable {
        require(msg.sender != address(0), "Zero address");
        require(_itemId <= itemCount, "invalid item");
        

         Item storage newSale = Items[_itemId];

        
        require(msg.value > newSale.price, "insufficient funds");

        payable(address(this)).transfer(newSale.price);
        
        purchased[_itemId] = true;

    }

    function availableItems() external view returns (Item[] memory ) {
        return itemsArray;
    }

}