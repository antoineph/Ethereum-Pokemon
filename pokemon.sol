contract EtherPokemon{
uint numPokemon;
function EtherPokemon{
  numPokemon = 0;
}
  struct Trainer {
    address ether_address;
    mapping (uint => Pokemon) public OwnedPokemon;
}
struct Pokemon {
  String Name;
  uint PokemonId;
  PokemonType Type;
}
enum PokemonType {Grass, Fire, Water, Electric}
struct Move {
  uint Damage;
}
  mapping (uint => Pokemon) public pokemonList;
  mapping (address => Trainer) public trainerList;
event Sent(address from, address to, uint amount);
function createPokemon(uint seed) returns (Pokemon){
  String pokemonName;
  PokemonType _pokemonType;
  uint HP;
if (seed < 300){
  pokemonName = "Bulbasaur";
  _pokemonType = Grass;
  HP = 100;
}
else if (seed < 600)  {
  pokemonName = "Charmander";
  _pokemonType = Fire;
  HP = 100;
}
else if (seed < 900){
  pokemonName = "Squirtle";
  _pokemonType = Water;
  HP = 100;
}
else{
  pokemonName = "Zapdos"
  _pokemonType = Electric;
  HP = 400;
}
  _pokemon = Pokemon(pokemonName, _pokemonType, HP);
  pokemonList[numPokemon++] = _pokemon;
};
// Add a Pokemon to a trainer
function addPokemon(Trainer _trainer,uint Id) {
 _trainer.Pokelist[Id] = pokemonList[Id];
}
// Remove a Pokemon from a trainer
function removePokemon(Trainer _trainer, uint Id) constant returns (bool) {
 if (_trainer.OwnedPokemon[Id] == 0x0){
   return false;
 }
 _trainer.OwnedPokemon[Id] = 0x0;
 return true;
}
function SendPokemon (Pokemon _pokemon, address sender, address receiver) {
  //remove ownership from sender
  removePokemon(trainerList[sender], _pokemon.id);
//set ownership to receiver
        addPokemon(trainerList[receiver], _pokemon.id);
  }
      function Coin() {
          minter = msg.sender;
      }
      function mint(address receiver, uint amount) {
          if (msg.sender != minter) return;
          balances[receiver] += amount;
      }
      function send(address receiver, uint amount) {
          if (balances[msg.sender] < amount) return;
          balances[msg.sender] -= amount;
          balances[receiver] += amount;
          Sent(msg.sender, receiver, amount);
      }
