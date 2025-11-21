// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract VotingContract {

    struct Candidate {
        string name;
        uint voteCount;
    }

    Candidate[] public candidates;

    mapping(address => bool) public hasVoted;
    mapping(bytes32 => bool) public candidateExists;
    mapping(bytes32 => uint256) public candidateIndex;

    address public owner;

    event CandidateAdded(string name);
    event VoteCast(address voter, string candidate);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not a valid owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addCandidate(string calldata _name) external onlyOwner {
        require(bytes(_name).length > 0, "Name cannot be empty");

        bytes32 hash = keccak256(abi.encodePacked(_name));
        require(!candidateExists[hash], "Candidate already exists");

        candidates.push(Candidate(_name, 0));
        candidateExists[hash] = true;
        candidateIndex[hash] = candidates.length - 1;

        emit CandidateAdded(_name);
    }

    function vote(string calldata _name) external {
        require(!hasVoted[msg.sender], "You already voted");

        bytes32 hash = keccak256(abi.encodePacked(_name));
        require(candidateExists[hash], "Candidate does not exist");

        uint index = candidateIndex[hash];
        candidates[index].voteCount++;

        hasVoted[msg.sender] = true;

        emit VoteCast(msg.sender, _name);
    }

    // Helper view: returns total candidates count
    function getCandidatesCount() external view returns (uint) {
        return candidates.length;
    }
}
