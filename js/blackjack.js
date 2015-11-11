function Game(decks, players){
  this.cards = []
  this.cardCount = 0
  this.dealer = new Player("Dealer")
  this.players = []

  for (var i = 0; i< decks; i++) {
    var newDeck = new Deck
    this.cards = this.cards.concat(newDeck.cards);
  }
  for (var i = 0; i< players; i++) {
    var newPlayer = new Player("Player"+(i+1))
    this.players.push(newPlayer);
  }
};

Game.prototype.hit = function(player) {
  var drawIndex = Math.floor(Math.random()*this.cards.length)
  var drawCard = this.cards[drawIndex];
  this.cards.splice(drawIndex, 1);
  player.cards.push(drawCard);
  player.total = cardTotal(player.cards);
  this.cardCount += cardCount(drawCard);
};

Game.prototype.deal = function() {
  this.hit(this.dealer);
  for (var i = 0; i < this.players.length; i++) {
    this.hit(this.players[i]);
    this.hit(this.players[i]);
  };
};

function cardCount(card){
  if (["2","3","4","5","6"].indexOf(card) >= 0){
    return 1;
  }else if (["7","8","9"].indexOf(card) >= 0){
    return 0
  }else if (["10","J","K","Q","A"].indexOf(card) >= 0){
    return -1
  }
}

function Deck(){
  this.cards = ["2","3","4","5","6","7","8","9","10","J","K","Q","A","2","3","4","5","6","7","8","9","10","J","K","Q","A","2","3","4","5","6","7","8","9","10","J","K","Q","A","2","3","4","5","6","7","8","9","10","J","K","Q","A"]
};

function Player(name){
  this.name = name,
  this.cards = [],
  this.total = 0,
  this.bust = false
};

function cardTotal(cards){
  var total = 0;
  for (var i = 0; i < cards.length; i++) {
    if(cards[i] === "A"){
      total += 11;
    }else if(["J","K","Q"].indexOf(cards[i]) >= 0){
      total += 10;
    }else{
      total += parseInt(cards[i]);
    }
  };
  if(total >= 21 && cards.indexOf("A" >= 0)){
    var aceIndex = cards.indexOf("A");
    var tempCards = cards.slice(0);
    tempCards.splice(aceIndex, 1);
    total = cardTotal(tempCards) + 1;
  }
  return total;
};


var game = new Game(1, 2);
console.log("Cards remaining: "+game.cards.length);
game.deal();
console.log(game.dealer)
for (var i = 0; i < game.players.length; i++) {
  console.log(game.players[i])
};
console.log("Cards remaining: "+game.cards.length);
console.log("Card Count: "+game.cardCount);