var board = [0,1,2,3,4,5,6,7,8]

// Keep track of whose turn it is
var turn = {
  number : 0,
  currentPlayerColor : function() {
    if (this.number % 2 === 0) {
      return 1;
    }
    else {
      return 2;
    }
  },
  changeTurn : function(){
    this.number += 1;
  }
};


// End the game, alert the winner and refresh the page
function endGame(message) {
  alert(message);
  location.reload();
}

// Check the value of a cell
function checkCell(cell) {
  var pos = $(cell).data("pos");

  return(board[pos]);
}

function changeCell(cell) {
  // Change cell to the player color
  var pos = $(cell).data("pos");

  board[pos] = turn.currentPlayerColor();
  if (turn.currentPlayerColor() == 1){
    // Remove hover class immediately once clicked
    $(".box_cell").click(function () {
      $(this).removeClass("hover");
    });
    $(cell).addClass('red');
  }
  else {
    $(cell).addClass('blue');
  }
}

$(document).ready(function(){
  // Fix to make hover work correctly
  $(".box_cell").hover(function () {
    $(this).addClass("hover");
  }, function () {
    $(this).removeClass("hover");
  });

  // Take the appropriate action when a box is clicked
  $('.box_cell').click(function(){
    var position = $(this).data("pos");
    var cell = this;

        $.ajax({
        type: "GET",
        url: "/play",
        data: { 'val': position },
        success: function(){
          changeCell(cell); 
        }
      });
    // Check if cell is 0 on the board
   // changeCell(this);

  //   if (checkCell(this) === 0 && winningPlayer === 0) {
  //     // Change color if it's 0
  //     changeCell(this);
  // };
  });

  $('#computer-start').click(function(){
    $.ajax({
      type:"GET",
      url: "/start"
    });
  });

});