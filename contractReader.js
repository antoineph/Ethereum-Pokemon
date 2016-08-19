//global web3 variable
var web3;
var contractEvents;
var pokemonContract;

//TODO: populate the next 3 variables after you deploy your contracts
var userAddress = "0x988382cf2840b78ff4d4327d7da9ef9fb9095434";
var receiverAddress = "0x3b2f827632cd84952e015df89b1f710e0a65613a";
var getPokemonContractAddress = "0xda1b4756477c175e56219b1164a3cc0d995e1217";
var getPokemonABI = [{"inputs":[{"name":"_addr","type":"address"}],"type":"constructor"}];

//init
function initWeb3(){


	  // set the provider you want from Web3.providers
	  web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));


	//instantiate the javascript object for the GetPokemon contract and it's event watcher
	pokemonContract = web3.eth.contract(getPokemonABI).at(getPokemonContractAddress);
	contractEvents = web3.eth.contract(getPokemonABI).at(getPokemonContractAddress).allEvents([/*TODO: add filter objects if necessary*/]);

	//set eventwatcher => use this for triggering stuff based on contract events on the Ethereum
	contractEvents.watch(function(error, result){

		if (!error) {
			console.log(result);

	  		//TODO:process events depending on the event type

	 	}

	});

}

//UI button click event handlers
//send ETH to pokemon contract
function sendETHForPokemon(_ETHValue){
initWeb3();
	if(_ETHValue == 1 || _ETHValue == 5){

	//	web3.eth.sendTransaction({from: userAddress, to: getPokemonContractAddress, value: _ETHValue});

	}

}

//trade pokemon
function tradePokemon(_id){

//	pokemonContract.TradePokemon(_id, userAddress, receiverAddress);

}
