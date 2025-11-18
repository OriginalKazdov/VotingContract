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

  function addCandidate(string calldata _name) external isOwner{
    require(_name,"Pensar como puedo hacer para que un candidato a la vez");
    candidates.push(Candidate(_name, 0));
  }

  function vote() external{

  }

}
