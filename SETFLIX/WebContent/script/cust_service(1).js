$(function() {
	var tabs = $( "#tabs" ).tabs();
	tabs.find( ".ui-tabs-nav" ).sortable({
		axis: "x",
		stop: function() {
		tabs.tabs( "refresh" );
		}
    });
	
	$('.toggle').click(function(e) {
		e.preventDefault();
	  
	    var $this = $(this);
	  
	    if ($this.next().hasClass('show')) {
	        $this.next().removeClass('show');
	        $this.next().slideUp(1);
	    } else {
	        $this.parent().parent().find('div .inner').removeClass('show');
	        $this.parent().parent().find('div .inner').slideUp(1);
	        $this.next().toggleClass('show');
	        $this.next().slideToggle(1);
	    }
	});
});

function search(){
	$(".sicon").click(function(){
		$(".sicon").hide();
		$(".search1").show();
	})
}