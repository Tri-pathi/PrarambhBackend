// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

pragma experimental ABIEncoderV2;
//in one of the function we are accessing two levels of dynamcic arrays 

import "hardhat/console.sol";

contract  DetailsContract{
    uint256  item_Id;
    uint256  sell_Id;

    event NewItem(address indexed from, uint256 timestamp, string Item_info);

    struct Item {
        address owner2; // The address of the user who build.
        string Item_info; // The message that  user want to sent.
        uint256 timestamp; // The timestamp when the product build.
    }

    //to hold all the waves anyone ever sends to me
    Item[] items;

    constructor() {
        console.log("Jay shree RAM: ");
    }

    function build(string memory _item_info) public {
        item_Id += 1;
        console.log("%s builded a w/ message %s", msg.sender, _item_info);
        items.push(Item(msg.sender, _item_info, block.timestamp));

        emit NewItem(msg.sender, block.timestamp, _item_info);
    }
   function sell() public payable returns (Item memory){
       require(item_Id>sell_Id);
     return items[sell_Id++];

 }
    function getTimeStamp() public view returns (uint256) {
        // this is why we need "pragma experimental ABIEncoderV2;"
           return items[sell_Id].timestamp;
    }

    function getItemId() public view returns (uint256) {
        console.log("We are building %d number product!", item_Id);
        return item_Id;
    }function sellItemId() public view returns (uint256) {
        console.log("We have %d sold items!", sell_Id);
        return sell_Id;
    }
    function totalItemLeft() public view returns (uint256) {
        console.log("We have %d total left items!", item_Id-sell_Id);
        return (item_Id-sell_Id);
    }
}