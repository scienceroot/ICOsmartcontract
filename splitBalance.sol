
//Train of thought: 

contract PaymentContract{
    
    //addresses we need to pay out to
    address[] authorAdresses;
    //our address (creator of the contract)
    address public minter;
    //OUR share in percent. 51000 = 51.000%
    //this is an int for now, need to change after I did some read-ups
    uint public SRSharePercentage;
    
    
    function PaymentContract(uint ourShare){
        SRSharePercentage = ourShare;
        minter = msg.sender;
    }
    
    function addAuthor(address authAddress){
        //only allow us to add new authors
        if (msg.sender == minter){
            authorAdresses.push(authAddress);
        }
    }

    function payout() public {
        //send our share first, split the rest
        uint balance = this.balance;
        uint ourMoney = balance*(SRSharePercentage/1000000);
        uint theirMoney = balance - ourMoney;
        
        for(uint i; i < authorAdresses.length; i++){
            authorAdresses[i].send(theirMoney/3);
        }
    }

    //gets called when a transaction is received
    function(){
        payout();
    }
}