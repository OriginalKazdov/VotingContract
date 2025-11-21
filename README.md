# 🗳️ VotingContract

A basic decentralized voting smart contract built in Solidity.

Users can vote for a candidate using their wallet address.  
Each address can vote **only once**, and candidates must be added by the contract owner.

---

## ✨ Features

- Owner can add candidates
- Prevents duplicate candidates
- One vote per wallet
- Vote by candidate name (hashed lookup)
- Emits events for UI / indexing

---

## 📘 What I Learned

- Validating input with `require()`
- Using `mapping` for efficient O(1) lookups
- String hashing with `keccak256`
- Storing data with `struct` + array
- Access control using a modifier (`onlyOwner`)
- Event emission for tracking actions

---

MIT License
