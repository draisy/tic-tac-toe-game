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

    $("#computer-start").click(function(){
    $.ajax({
      type:"GET",
      url: "/start_one_player",
      success: function(){
        setRestart();
      }
    });
  });

    $("#players-start").click(function(){
    $.ajax({
      type:"GET",
      url: "/start_two_players",
      success: function(){
        setRestart();
      }
    });
  });

  $("#players-restart").click(function(){
      $.ajax({
      type:"GET",
      url: "/start_two_players",
      success: function(){
        removeMoves();
        setRestart();
      }
    });
  });

  $("#computer-restart").click(function(){
      $.ajax({
      type:"GET",
      url: "/start_one_player",
      success: function(){
        removeMoves();
        setRestart();
      }
    });
  });

  $("#instructions").click(function(){
    $("#info").toggle()
  })

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

function setRestart(){
  loadStart();
  swapIcons();
}

function loadStart(){
  var go = document.getElementById("go")
  go.style.visibility = "visible";
}

function removeMoves(){
  var icons = $("i");

  for (var i = 4; i < icons.length; i ++){
      $(icons[i]).removeClass();
  };
};

function swapIcons(){

  var restartIcons = $(".restart");
  for(var i = 0; i < restartIcons.length; i ++){
    restartIcons[i].style.display = "inline-block";
  };

  var startIcons = $(".start");
  for (var i = 0; i < startIcons.length; i ++ ){
    startIcons[i].style.display = "none";
  };
}

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

