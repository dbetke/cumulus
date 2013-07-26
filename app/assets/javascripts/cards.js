$(document).ready(function(){

  $("#addNewTag").click(function(){
    $.d("NewTag Click");
    $("#skillSet").append($("#newSkillForm").html());
  });

});