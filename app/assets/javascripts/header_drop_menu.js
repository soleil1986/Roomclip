$(function(){
  $(".l-header__user").on("click", function(){
    $(".l-header__dropdown-menu ").not(":animated").fadeToggle(100)
  });
});
