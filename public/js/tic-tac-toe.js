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
  },
  getNumber : function(){
    return this.number;
  }
};


function changeCell(cell) {
  // Change cell to the player color

  if (turn.currentPlayerColor() == 2){
    // Remove hover class immediately once clicked
    $(".box_cell").click(function () {
      $(this).removeClass("hover");
    });
   // debugger;
    $(cell).find('i').addClass('fa fa-times fa-5x')
   // $(cell).addClass('red');
  }
  else {
    $(cell).find('i').addClass('fa fa-circle-o fa-5x')
   // $(cell).addClass('blue');
  }
};

$(document).ready(function(){
  // Fix to make hover work correctly
  $(".box_cell").hover(function () {
    $(this).addClass("hover");
  }, function () {
    $(this).removeClass("hover");
  });

  // Take the appropriate action when a box is clicked
  $('.box_cell').click(function(){
  //  turn.changeTurn();
    var position = $(this).data("pos");
    var cell = this;
    changeCell(cell);
        $.ajax({
        type: "GET",
        url: "/play",
        data: { 'player': turn.currentPlayerColor(), 'val': position },
        success: function(){
        }
      });
  });

    $('#computer-start').click(function(){
    $.ajax({
      type:"GET",
      url: "/start_one_player"
    });
  });

    $('#players-start').click(function(){
    $.ajax({
      type:"GET",
      url: "/start_two_players"
    });
  });

});