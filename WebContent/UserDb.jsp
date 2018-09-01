<div class="modal-dialog modal-lg" style=" top: -35px; margin-left: 65px;">


		

	<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header" id="Userdb_header_clr"
			style="background-color: #573e7c">

			<h4 class="modal-title"
				style="text-transform: uppercase; color: white; font-weight: bolder;">
				Visualize by relations</h4>
			<h5 id="h5usrPerm" style="color: #e4f50a"></h5>
		</div>
		<div class="modal-body" style="padding: 25px;">
			<div class="row"
				style="background-color: white; padding: 10px 0px 0px;">


				<div class="col-md-9">
					<div class="form-group">

						<input type="text" placeholder="RELATION NAME"
							class="form-control" id="relationname">

					</div>
				</div>

				<div class="col-md-3">

					<button  type="button" attr-val="Users" id="generategraph"
						class="button button2" >Show Graph</button>

				</div>


		</div>
			<div style="display: block; height: 10px"></div>
			<div class="row" style="background-color: white;">


				<div class="col-sm-4">
					<span style="font-size: 20px; color: #FB95AF"
						class="glyphicon glyphicon-stop"></span> PROVIDER
				</div>
				<div class="col-sm-4">
					<span style="font-size: 20px; color: #68BDF6"
						class="glyphicon glyphicon-stop"></span> MEMBER
				</div>
				<div class="col-sm-4">
					<span style="font-size: 20px; color: #DE9BF9"
						class="glyphicon glyphicon-stop"></span> CLAIM
				</div>

			</div>
			<div style="display: block; height: 10px"></div>
			
			<div class="row">
			<div class="callMeta bs-callout bs-callout-success" style="display: block;background-color: white;" >
  				<h5 style="color: green;font-weight: bold;">Invalid attribute </h5> </div>
			</div>
			
					
			<div class="row" style="background-color: white;">


				<div class="col">

					<div class="col-sm-9">
					<div class="form-group" id="embed_graph"  class="ntwk-class">
					
					
					</div>
					<!-- <div id="embed_graph" class="ntwk-class"> -->
					</div>
					
					<!-- <div class="col-sm-3" id="relationss" class="callMeta bs-callout bs-callout-success" style="display: block;background-color: white;"></div> -->
					<br><div class="col-sm-3" id="relationss"  style="margin-left: -116px; "   >
					
					<!-- <script type="text/javascript" src="hello.js"></script> -->
					
					</div>
					
					<br>
					<br>
					   <div class="col-sm-3" id="rr"  style="margin-left: -117px; width: 263px; " >  </div> 
					 <!--   <div id="rr"  style="margin-left: -425px ;  width: 263px; " >  </div>  -->
					  
			</div>
				</div>
				
			
			
				
			</div>
		</div>

		
	</div>

	<style>
.ntwk-class {
	width: 90%;
	margin-left: 135px;
}



.nav li:hover:nth-child(8n+3), .nav li.active:nth-child(8n+3) {
	border-bottom: #69bd8e 3px solid !important;
}

.nav li:hover:nth-child(8n+2), .nav li.active:nth-child(8n+2) {
	border-bottom: #573e7c 3px solid !important;
}
</style>

	<span id="attribVal" style="visibility: hidden"></span>


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>



	$(function() {
		var availableTags = [ "ActionScript", "AppleScript", "Asp", "BASIC",
				"C", "C++", "Clojure", "COBOL", "ColdFusion", "Erlang",
				"Fortran", "Groovy", "Haskell", "Java", "JavaScript", "Lisp",
				"Perl", "PHP", "Python", "Ruby", "Scala", "Scheme" ];
		/*   $( "#relationname" ).autocomplete({
		   // source: availableTags
		  }); */
	});
</script>
<link rel="stylesheet"href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">