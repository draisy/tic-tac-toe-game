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
       addFirstPlayerIcons();
       loadStart();
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
    removeMoves();
    swapRestartIconsOut();
  });

  $("#computer-first").click(function(){
      $.ajax({
      type:"GET",
      url: "/start_computer",
      success: function(){
        setRestart();
        removeFirstIcons();
      }
    });
  });

  $("#player-first").click(function(){
    $.ajax({
    type:"GET",
    url: "/start_player",
    success: function(){
      setRestart();
      removeFirstIcons();
      }
    });
  });

  $("#info").click(function(){
    $("#instructions").toggle()
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

function setRestart(){
  loadGo();
  swapRestartIconsIn();
}

function loadGo(){
  var go = document.getElementById("go")
  go.style.visibility = "visible";
}

function swapRestartIconsIn(){
  var restartIcons = $(".restart");
  for(var i = 0; i < restartIcons.length; i ++){
    restartIcons[i].style.display = "inline-block";
  };
  removeStartIcons();
};

function removeStartIcons(){
  var startIcons = $(".start");
  for (var i = 0; i < startIcons.length; i ++ ){
    startIcons[i].style.display = "none";
  };
};

function hideGo(){
  var go = document.getElementById("go")
  go.style.visibility = "hidden";
}

function loadStart(){
  var starts = document.getElementById("whostarts")
  starts.style.visibility = "visible";
}

function hideStart(){
  var starts = document.getElementById("whostarts")
  starts.style.visibility = "hidden";
}

function removeMoves(){
  var icons = $("i");
  for (var i = 8; i < icons.length; i ++){
      $(icons[i]).removeClass();
  };
};

function addFirstPlayerIcons(){
  var firstIcons = $(".first");
  for(var i = 0; i < firstIcons.length; i ++){
    firstIcons[i].style.display = "inline-block";
  };
  removeStartIcons();
};

function removeRestartIcons(){
  var restartIcons = $(".restart");
  for(var i = 0; i < restartIcons.length; i ++){
    restartIcons[i].style.display = "none";
  };  
};

function removeFirstIcons(){
  var firstIcons = $(".first");
  for(var i = 0; i < firstIcons.length; i ++){
    firstIcons[i].style.display = "none";
  };
  hideStart();
}

function swapRestartIconsOut() {
  removeRestartIcons();
  addFirstPlayerIcons();
  hideGo();
  loadStart();
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

