$(document).ready(function(){
  // hover fix
  $(".cell").hover(function () {
    $(this).addClass("hover");
  }, function () {
    $(this).removeClass("hover");
  });

  // Event handler when player selects a cell
  $('.cell').click(function(){
    var position = $(this).data("pos");
    var cell = this;
    updateCell(cell);
        $.ajax({
        type: "GET",
        url: "/play",
        data: { 'player': turn.currentPlayer(), 'val': position },
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

// Keep track of whose turn it is
var turn = {
  number : 0,
  currentPlayer : function() {
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

function updateCell(cell) {

  if (turn.currentPlayer() == 1){
    $(".cell").click(function () {
      $(this).removeClass("hover");
    });
    $(cell).find('i').addClass('fa fa-times fa-5x');
  }
  else {
    $(cell).find('i').addClass('fa fa-circle-o fa-5x');
  }
};

