pragma solidity ^0.4.0; 
contract GuessNumber {
    address public creator; // data-type 'address'
    uint public answer; // data-type 'unit'

    event Guessed(address _guesser, uint _number);

    function GuessNumber() payable {
        creator = msg.sender; // set 'creator' variable to address of transaction sender
        answer = 9;
    }    

    function guess(uint input) returns (bool success) {
        
        Guessed(msg.sender, input);
	if (input == answer) {
    	   msg.sender.send(7); // send 1 ETH to creator
        }
        return true;   
    }

    function getPot() constant returns (uint) {
        return this.balance;
    }
}
