

contract EtherPokemon{

  uint numPokemon;


  function EtherPokemon () {
    numPokemon = 0;
  }


  struct Pokemon {
    uint Id;
    uint PokemonId;
  }
    struct Trainer {
      string Name;
      mapping (uint => Pokemon) OwnedPokemon;
  }





  mapping (uint => Pokemon) public pokemonList;
  mapping (address => Trainer) public trainerList;

function createPokemon() constant returns (uint){
  uint _PokemonId;
  uint seed = uint(sha3(block.timestamp))%1000 +1;

if (seed < 300){
  _PokemonId = 1;
}

else if (seed < 600)  {
  _PokemonId = 2;
}
else if (seed < 900){
  _PokemonId = 3;
}
else {
  _PokemonId = 4;
}

  Pokemon _pokemon = pokemonList[numPokemon];
  _pokemon.Id = numPokemon;
  _pokemon.PokemonId = _PokemonId;
  numPokemon++;

return _PokemonId;

  //pokemonList[numPokemon++] = _pokemon;
}

function newTrainer(address _trainerAddr){
  Trainer _trainer = trainerList[_trainerAddr];
}
// Add a Pokemon to a trainer
function addPokemon(address _trainerAddr,uint Id) {

 trainerList[_trainerAddr].OwnedPokemon[Id] = pokemonList[Id];
}

// Remove a Pokemon from a trainer
function removePokemon(address _trainerAddr, uint Id){

 delete trainerList[_trainerAddr].OwnedPokemon[Id];
}

function SendPokemon (uint Id, address sender, address receiver) {

  //remove ownership from sender
  removePokemon(sender, Id);
//set ownership to receiver
        addPokemon(receiver, Id);
  }
}
