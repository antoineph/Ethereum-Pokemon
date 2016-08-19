import "contracts/sol/EtherPokemon.sol";

contract GetPokemon {

  EtherPokemon EXP;
  address addr;

  function(){
    uint ethValue = msg.value/100000000;
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
}
