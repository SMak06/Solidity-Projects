pragma solidity >=0.4.22 <0.6.0;
contract SimpleCoin{

    string public name;
    string public symbol;
    uint8 public decimals = 18;

    mapping (address => uint256) public balances; //hash map
    mapping (address => mapping (address => uint256)) public allowance;

    constructor(
       // uint256 initialSupply,
    //    string memory tokenName,
      //  string memory tokenSymbol
    ) public {
        // totalSupply = initialSupply * 10 ** uint256(decimals);
        balances[msg.sender] = 60000;
        name = "SCoin";
        symbol = "S$M";
    }

   // function totalSupply() view public returns (uint256 );

    function balanceOf(address _owner) view public returns (uint256 ){
        return balances[_owner];
    }
     event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function transfer(address _to, uint256 _amount) public returns (bool){
        if (balances[msg.sender] >= _amount && _amount > 0) {

            balances[msg.sender] -= _amount;
            balances[_to] += _amount;

            emit Transfer(msg.sender, _to, _amount); //signal
            return true;
        } else {
           return false;
        }
    }


}
