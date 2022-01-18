pragma solidity >=0.5.0 <0.6.0; // version pragma - a declaration of the version of the Solidity compiler this code should use

/* Solidity's code is encapsulated in contracts. A contract is the fundamental building block of Ethereum applications — all variables and functions belong to a contract, and this will be the starting point of all your projects.
* The syntax is-  contract Contract_name {  coding stuff inside  }
*/

contract ZombieFactory {

    

    uint dnaDigits = 16;  // Variable declaration - state the datatype of variable before using it. (uint stands for unsigned integers)
    uint dnaModulus = 10 ** dnaDigits;  //Math is straightforward like any other language

// Struct types are used to represent a record. It is like a user-defined or custom database

    struct Zombie {
        string name;
        uint dna;
    }
    
/* Array - When you want a collection of something, you can use an array. There are two types of arrays in Solidity: fixed arrays and dynamic arrays:
 * You can declare an array as public, and Solidity will automatically create a getter method for it.
 * Other contracts would then be able to read from, but not write to, this array. So this is a useful pattern for storing public data in your contract.
 * The syntax is ( struct_name[] public/private(#optional) array_name; )
 */
 
    Zombie[] public zombies;

/* Function Declaration - it is like any other programming language.
 * the syntax is: function FunctionName(Parameters, you, want, to, pass) visibility_type(#public by default) {coding stuff}
 */
 
    function _createZombie(string memory _name, uint _dna) private {
        // Adding stuff to structs. 
        // array.push() adds something to the end of the array, so the elements are in the order we added them.
        zombies.push(Zombie(_name, _dna));
       
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
