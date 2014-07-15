$(document).ready( function(){
  $('#phone_tool_tip').mouseover( function(){
    $('#phone_tool_tip').popover('show');
  });
  $('#phone_tool_tip').mouseout( function(){
    $('#phone_tool_tip').popover('hide');
  });
});
