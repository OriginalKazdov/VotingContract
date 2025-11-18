// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract VotingContract{

  struct Candidate{
    string name;
    uint voteCount;
  }

  Candidate[] public candidates;
  mapping(address => bool) public hasVoted;
  address public owner;

  modifier isOwner {
    require(msg.sender == owner, "Not a valid owner");
    _;
  }

  constructor(){
    owner = msg.sender;
  }

  function addCandidate() external{

  }

  function vote() external{

  }

}
