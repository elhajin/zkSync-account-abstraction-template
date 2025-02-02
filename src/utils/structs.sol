//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

struct Inheritor {
    string description; // [opt] a description of an inheritor
    uint8 percentage; // the percentage the owner set to the inheritor
    uint256 id; // the id of the inheritor
}

struct RequestWithdraw {
    bool requestExsit; // if there is a request made by an inheritor;
    uint256 timestamp; // the time when the reques set
    address caller; // the inheritor that made the request
}

struct mainStorage {
    bytes1 mode;
    address mainInheritor; //after last inheritor withdrawed the contract get destroyed and the funds send to this address
    address owner; // the owner of the contract gonna be the deployer ;
    RequestWithdraw requestWithdraw; //if there is a request to withdraw any inheritor can set it by passing some conditions;
    uint8 countInheritors; //this will be the number of inheritors the owner set;
    uint256 duration; //time to pass from sending request to allow the inheritor to withdraw thier share
    uint256 lastUpdate; // changes when the owner cancel requests;(it will change when ever the owner interact with the contract)
    uint256 fromLastUpdate; // have to pass lastUdate + fromLastUpdate to send a new request;
    uint8 availablePercentage; //the percentage available for inherit;
    mapping(address => uint256) tokenForEachPercentage; // token for each 1% , for each token
    mapping(address => bool) isInheritor; //check if this address is inheritor of the owner
    mapping(address => Inheritor) inheritor; // get inheritor info (struct) ;
    mapping(address => mapping(address => bool)) didWithraw; //inheritor => token => did withdraw;
    mapping(address => uint8) countWithdraws; //how many inheritor did withdraw this token.
    bool initiated;
}
