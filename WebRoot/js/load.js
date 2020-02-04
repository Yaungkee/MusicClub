function load(){
    		$.post(
    			"test",
    			function(result){
    				var shares=eval(result);
    				console.log(shares);
    				$.each(shares,function(i,element){
    					/*console.log(this.commentid+"  "+this.username+"  "+this.comment+"  "+this.create_dt+"  "+this.like);*/
    				})
    			},"json");
    	};