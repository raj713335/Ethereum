pragma solidity ^0.5.1;

contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    
    uint256 openingTime = 1628163487;
    
    modifier onlyWhileopen(){
        require(block.timestamp >= openingTime);
        _;
    }
    
    
    struct Person{
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyWhileopen {
        incremetCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incremetCount() internal {
        peopleCount+=1;
    }
}
