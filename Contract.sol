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
    //with private functions its convention to start them with _
    function _createZombie(string memory _name, uint _dna) private {
            zombies.push(Zombie(_name,_dna));
    }

    //pure function could be called with parameters that don't read any data from the app's state
    //view functions can return data about the state of the app but won't modify said data
    function _generateRandomDna(string memory _str) private view returns (uint){
        
    }
}
