pragma solidity ^0.5.1;

contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    
    address owner;
    
    modifier onlyQwner(){
        require(msg.sender==owner);
        _;
    }
    
    
    struct Person{
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    constructor() public{
        owner = msg.sender;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyQwner {
        incremetCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incremetCount() internal {
        peopleCount+=1;
    }
}
