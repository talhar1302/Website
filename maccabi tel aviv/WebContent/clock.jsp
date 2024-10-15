		<script language="javascript">
			function clock ()
			{
				var date=new Date();
				var seconds=date.getSeconds();
				if (seconds<10)
					seconds="0"+seconds;
				var minutes=date.getMinutes();
				if (minutes<10)
					minutes="0"+minutes;
				var hours=date.getHours();
				if (hours<10)
					hours="0"+hours;
				var clock=hours+":"+minutes+":"+seconds;
				document.clockForm.clock.value=clock;
			}
		</script>	
					<form name="clockForm">
						<input type="text" name="clock" style="background-color:yellow; color: aqua; border: 0;text-align:center;font-size:400%" readonly />
					</form>