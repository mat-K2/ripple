var src="http://localhost:3000/entries/new?url=" + location.href;
document.write("<link rel='stylesheet' href='http://localhost:3000/assets/embed_form.css' type='text/css' media='all' /><script type='text/javascript' src='http://localhost:3000/assets/jquery.slider.min.js'></script><div id='rippler-embed'><a href='#', id='open-close-trigger'><div>フィードバックを送る</div></a><iframe id='rippler-feedback' src=" + src + " width='100%' height='100%'></iframe></div>");

$(document).ready(function(){
  $("#open-close-trigger").click(function(){
    var embed_height = $("#rippler-embed").width();
    console.log(embed_height);
    if(embed_height == 250){
      $("#rippler-embed").animate({
        width: "+=100px",
        height: "+=250px"
      });
    }else{
      $("#rippler-embed").animate({
        width: "-=100px",
        height: "-=250px"
      });
    }
  });
});
