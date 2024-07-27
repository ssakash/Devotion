// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract voting {

   address owner;

   constructor ()
   {
    owner = msg.sender;
   }

  struct vote {
    address walletaddr;
    string firstname;
    string lastname;
    uint votes;
  }

  vote[] public candidates;

 modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can perform this action.");
    _;
}
  function addcandidate(address walletaddr, string memory firstname, string memory lastname, uint votes) public onlyOwner
    {
        candidates.push(vote(walletaddr,firstname,lastname, votes));
    }

  function addvotetocandidate(address walletaddr) private 
  {
       for(uint i=0; i < candidates.length;i++)
        {
            if(candidates[i].walletaddr == walletaddr)
                candidates[i].votes += 1;
        }
  }
  function voteforcandidate (address walletaddr) payable public {addvotetocandidate(walletaddr);}

}