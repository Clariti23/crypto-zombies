pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

    // fire an event so that your front-end can listen for specific SC events
    // like when a zombie is created
    event NewZombie(uint zombieId, string name, uint dna);

    // uints must be positive
    uint dnaDigits = 16;

    // use ** for exponentiation
    uint dnaModulus = 10 ** dnaDigits;

    //introduce data type: struct
    struct Zombie {
        string name;
        uint dna;
    }

    // Public array readable by outside contracts
    Zombie[] public zombies;

    //standard format for functions, use _variable to distinguish from global variable
    //with private functions its convention to start them with _
    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
            // emit an event
        emit NewZombie(id, _name, _dna);
    }

    //pure function could be called with parameters that don't read any data from the app's state
    //view functions can return data about the state of the app but won't modify said data
    function _generateRandomDna(string memory _str) private view returns (uint){
        //encode the string with keccak 256 hash function
        //typecast the result of hash function as uint and store it
       uint rand = uint(keccak256(abi.encodePacked(_str)));
       //return 16 digits of dna only using modulo operator
       return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name,randDna);
    }


}
