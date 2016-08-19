import "contracts/sol/EtherPokemon.sol";
contract GetPokemon {
  address public owner;
  uint public ethValue;
  EtherPokemon EXP;
  address addr;
  function(){
    ethValue = msg.value/100000000;
    if(ethValue <1){
      throw;
    }
    for(uint y = 0; y < ethValue; y++){
       uint Id = EXP.createPokemon();
       EXP.addPokemon(msg.sender,Id);
    }
  }
  function GetPokemon() {
      EXP = EtherPokemon(addr);
  }

  function TradePokemon(uint _id, address _sender, address _receiver){
    SendPokemon (Pokemon _pokemon, address sender, address receiver)

      //TODO: get Pokemon object _pokemon based on _id (because only the id is passed from the UI)

    EXP.SendPokemon(_pokemon, _sender, _receiver);

  }