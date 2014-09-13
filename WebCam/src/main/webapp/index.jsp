<html lang="en">
<head>
	<title>Take Photo</title>	
	<script type="text/javascript">
appContextPath='<%=request.getContextPath()%>';
</script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
	<%-- <script src="<%=request.getContextPath()%>/js/jquery-ui.min.js" ></script>	 --%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/webcam/webcam.js"></script>

</head>
<body>
	<table><tr><td valign=top>	
	<!-- First, include the JPEGCam JavaScript Library -->
	
	
	<!-- Configure a few settings -->
	<script type="text/javascript">
		webcam.set_api_url( '<%=request.getContextPath()%>/photo' );
		webcam.set_quality( 90 ); // JPEG quality (1 - 100)
		webcam.set_shutter_sound( false ); // play shutter click sound
	</script>
	
	<!-- Next, write the movie to the page at 320x240 -->
	<script type="text/javascript">
		document.write( webcam.get_html(320, 240) );
	</script>
	
	<!-- Some buttons for controlling things -->
	<br/><form>
		<p class="uploadDiv">
			<!-- <input type=button value="Reset" onClick="webcam.configure()" class="uploadButton">&nbsp;&nbsp; -->
			<div id="cameraSnapBtn"><input type="button" value="Take a Snap" onClick="take_snapshot()" class="uploadButton"></div>
			<div id="cameraErrorMsg"></div>		
			<!-- <input type="button" name="B1" value="Done" onClick="funOnClosePopUp()" class="uploadButton" />  -->
		</p>		 		
	</form>
	
	<!-- Code to handle the server response (see test.php) -->
	<script type="text/javascript">
		webcam.set_hook( 'onComplete', 'my_completion_handler' );
		
		function take_snapshot() {
			// take snapshot and upload to server
			webcam.snap();
		}
		
		function my_completion_handler(data) {			
				$('#upload_results').html(data);
				webcam.reset();	
		}
	</script>	
	</td>
		<td width=50>&nbsp;</td><td valign=top>
			<div id="upload_results" style="background:yellow;"></div>
		</td>
	</tr>
	</table>
</body>
</html>