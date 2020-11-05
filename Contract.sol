pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

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
    function createZombie(string memory _name, uint _dna) public {

    }
}
