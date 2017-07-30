pragma solidity ^0.4.0; 
contract GuessNumber {
    address public creator; // data-type 'address'
    uint private answer; // data-type 'unit'

    event Guessed(address _guesser, uint _number);

    function GuessNumber() payable {
        creator = msg.sender; // set 'creator' variable to address of transaction sender
        answer = 9;
    }    

    function guess(uint input) returns (bool success) {
        
        Guessed(msg.sender, input);
	if (input == answer) {
    	   msg.sender.send(7); // send 7 Wei to winner
        }
        return true;   
    }

    function changeAnswer(uint newAnswer) {
        if (msg.sender != creator) throw; // only creator can set answer
        answer = newAnswer;
    }

    function getBal() constant returns (uint) {
        return this.balance;
    }
}
