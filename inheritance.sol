// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract inheritance {

 address owner;

   constructor ()
   {
    owner = msg.sender;
   }

  struct kid {
    address walletaddr;
    string firstname;
    string lastname;
    uint releasetime;
    uint amount;
    bool canwithdraw;
  }

  kid[] public kids;

  function addkid(address walletaddr, string memory firstname, string memory lastname, uint releasetime, uint amount,
    bool canwithdraw) public
    {
        kids.push(kid(walletaddr,firstname,lastname,releasetime,amount,canwithdraw));
    }

    function balanceof() public view returns (uint) {
        return address (this).balance;
    }
    
    function addtokidsbalance(address walletaddr) private {
        for(uint i=0; i < kids.length;i++)
        {
            if(kids[i].walletaddr == walletaddr)
                kids[i].amount += msg.value;
        }
    } 

    function deposit (address walletaddr) payable public {addtokidsbalance(walletaddr);}
}