		var dragging;
	    var canvas;
        var c = document.getElementById("lineCanvas");
		var ctx = c.getContext("2d");
		var ctx2 = c.getContext("2d");
		var ctx3 = c.getContext("2d");
		var rangeValue;
		var heightValue;
		var velocity = 0;
		var ID;
 $(function drawline() { 
    $( "#draggable" ).draggable({ containment: "#containment-wrapper", scroll: true });
           });
	function set_velocity(value)
	{
	    velocity = value/5;
	   
		refresh();
	}
	function set_photo(value)
	{
		if( value == 1)
		{
			document.getElementById("photo").src = "images/crosshair3.png";
		}
		else if(value == 2)
		{
			document.getElementById("photo").src = "images/crosshair1.png";
		}
		else if (value == 3) {
		    document.getElementById("photo").src = "images/crosshair2.png";
		}
		else
		{
		    document.getElementById("photo").src = "images/crosshair.png";
		}
	}

	function test(value) {
	    var x = value;
	    document.getElementById("divx").innerHTML = x;
	}

	function refresh()
	{
		mydraw();
	}
   function mydraw()
          {
          dragging =  $("#draggable").position();
			canvas = $("#lineCanvas").position();
			var time = duration();
          ctx.clearRect(0,0,c.width,c.height);
		  ctx2.clearRect(0,0,c.width,c.height);
		  ctx3.clearRect(0,0,c.width,c.height);
          ctx.beginPath();
		  ctx.strokeStyle = "red";
          ctx.moveTo(0,c.height);

          
          
		  var ycoord = 0;
		  var xcoord = 0;
		  for(var i = 0; i < time; i++)
		  {
			ycoord = fg2(i);
			xcoord = fg(i);
			ctx.lineTo(xcoord,ycoord*-1+c.height);
		  }
		  
		  
          ctx.stroke();
        if(document.getElementById('bestshot').checked)
		  {
		  ctx2.beginPath();
		  ctx2.strokeStyle = "green";
		  ctx2.moveTo(0,c.height);
		  var time2 = best_time();
		  
		  for(var i = 0; i < time2; i++)
		  {
			ycoord = best_shot(i);
			xcoord = best_x(i);
			ctx2.lineTo(xcoord,ycoord*-1+c.height);
		  }
		  ctx2.stroke();
        }
       
		  ctx3.beginPath();
		  ctx3.textAlign = "start";
		  ctx3.strokeStyle = "#009DA9";
		  ctx3.lineWidth = 3;
		  ctx3.fillStyle = "white";
		  ctx3.font = "15px bold";
		  ctx3.moveTo(0,0);
		  ctx3.fillText((0*-1+c.height)*25,10,10);
		  for(var i = 0; i < c.height;)
		  {
			
			ctx3.lineTo(10,i);
			ctx3.fillText((i*-1+c.height)*25,10,i);
			ctx3.lineTo(0,i);
			ctx3.lineTo(0,i+50);
			i+=50;
			
		  }
		  ctx3.textAlign = "right";
		  ctx3.fillText(0, 10, 10 * -1 + c.height);
		  for(var i = 0; i < c.width;)
		  {
			
			ctx3.lineTo(i,10*-1+c.height);
			ctx3.fillText(i*25,i,10*-1+c.height);
			ctx3.lineTo(i,0*-1+c.height);
			
			ctx3.lineTo(i+50,0*-1+c.height);
			i+=50;
			
		  }
		  ctx3.lineTo(c.width,c.height);
		  ctx3.fillText(c.width*25,c.width-5,c.height - 10);
		  ctx3.stroke();
		
		  rangeValue.value = get_x()*25;
		  heightValue.value = get_y() * 25 + 175;
		  velocity_set(ID);
          
   }
   function getVelocity()
   {
       return velocity;
   }
   function velocity_set(id) {

       ID = id;
       ID.value = getVelocity() * 5;
   }
  
   function set_calculation(range, height) {
       rangeValue = range;
       heightValue = height;
       if (range.value <= 16250)
       {
           x = (range.value / 25) - 15;
       }
       if (height.value <= 12500) {
           y = (height.value / -25) - 15;
       }
       document.getElementById("draggable").style.left = x+'px';
       document.getElementById("draggable").style.top = y+'px';
       refresh();

   }
	function best_time()
	{
		var angle = best_angle();
		var speedy = vert_speed(angle);
		var y = get_y();
		var seconds = (-speedy - Math.sqrt(((speedy*speedy) - (4 * (-4.9) * y))))/-9.8;
		return seconds;
	}
	function best_angle()
	{
		var x = get_x();
		var y = get_y();
		var speedsqr = velocity*velocity;
		var g = 9.8;
		var angle = Math.atan2((speedsqr - Math.sqrt((speedsqr*speedsqr) - (g*((g*x*x) + (2*y*speedsqr))))),g*x);
		
			return angle;
		
		
	}
	function best_x(time)
	{
		var angle = best_angle();
		var speedx = horz_speed(angle);
		return (speedx * time);
	}
	function best_shot(time)
	{
		var angle = best_angle();
		var speedy = vert_speed(angle);
		return ((speedy*time) + (1/2*(-9.8)*time*time)) ;
	}
	function get_x()
	{
		return dragging.left - canvas.left + 15;
	}
	function get_y()
	{
		return (dragging.top + 15 - canvas.top - c.height ) * -1 ;
		
	}
	function get_angle()
	{
		var y = get_y();
		var x = get_x();
		var angle = Math.atan2(y,x);
		return angle;
	}
	function vert_speed(angle)
	{
		return velocity * Math.sin(angle);
	}
	function horz_speed(angle)
	{
		return velocity * Math.cos(angle);
	}
	function duration()
	{
		var angle = get_angle();
		var speedy = vert_speed(angle);
		var y = get_y();
		var seconds = (-speedy - Math.sqrt(((speedy*speedy) - (4 * (-4.9) * y))))/-9.8;
		return seconds;
	}
	function fg2(time)
	{
		var angle = get_angle();
		var speedy = vert_speed(angle);
		return ((speedy*time) + (1/2*(-9.8)*time*time)) ;
	}
	function fg(time) 
	{
		var angle = get_angle();
		var speedx = horz_speed(angle);
		return (speedx * time);
	}