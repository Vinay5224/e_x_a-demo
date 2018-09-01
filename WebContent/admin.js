/**
 * 
 */

$(document).ready(function(){




	console.log("doc load"+location.hostname);

	console.log("------------"+$("#sel1").val());
	$("#applychanges").css("opacity",.5);
	$("#applychanges").attr("disabled","disabled");
	$("input:checkbox").prop('checked', false);


	///////search_member
	$("#Search_member_details").on('click',function(){
		console.log("Search_member_details");
		var srch =$("#query_Member").val();
		srch.trim();
		console.log(srch);
		$("#Member_response").html("");
		$("#Member_response").append('<tr><td colspan="7"><div class="progress"> <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:100%"> </div> </div><td><tr>');


		/////////////////////////
		$.ajax({

			url : "http://"+location.hostname+":8080/sparkweb/CallMem",
			type:"POST",
			data:{module:"getMemberDatails",Search_member:srch},

			success : function(responseText) {
				console.log("console"+responseText);
				var f=responseText.trim(); 
				
				if(f ==""){
					$("#Member_response").html("");
					$("#Member_response").append('<tr><td colspan="7"  style="font-style: italic;font-size: x-large;color: #ff1b00;">"'+srch +' " not found <td><tr>');
				}else{

					
					$("#Member_response").html("");
					$("#Member_response").append(f);
						
				}
				
				

			}
		});			
		//////////////////////////


	});





	////////ShowMemberSearch
	$("#ShowMemberSearch").on('click',function(){
		$("#Ifrm1").hide();
		$("#MemberSearch").show();	

	});




	//////////ShowProviderSearch
	$("#ShowProviderSearch").on('click',function(){
		$("#Ifrm2").hide();
		$("#ProviderSearch").show();

	});


	//////////////ShowClaimSearch
	$("#ShowClaimSearch").on('click',function(){
		$("#Ifrm3").hide();
		$("#ClaimSearch").show();

	});

	//////////////ShowClaimSearch
	$("#ShowPopSearch").on('click',function(){
		$("#Ifrm4").hide();
		$("#PopSearch").show();

	});



	/////////////change color and get val
	$(".Dbs").on('click',function(){
		/* $("#addUser").hide();
			$("#config").hide();*/
		$(".act").hide();
		$("#adminReports").show();
		var typeis =$(this).attr("data-attr");
		console.log("(((((((((((("+typeis);
		/* if(typeis =="user")
			 $("#Userdb_header_clr").css("background-color","#573e7c");
		 else
			 $("#Userdb_header_clr").css("background-color","#69bd8e");
		 */

	});


	
	
	  /////////////////////////configTab
	  $("#premission").on('click',function(){
		  console.log("AddUserTab");
		/*  $("#addUser").hide();$("#UserDb").hide();*/
		  $(".act").hide();
		  $("#config").fadeIn("slow");
		  
		  
	  });
	  
	  
	  
	  
	  $("#Neo4jd").on('click',function(){
		  console.log("AddUserTab");
		/*  $("#addUser").hide();$("#UserDb").hide();*/
		  $(".act").hide();
		  $("#neo4j").fadeIn("slow");
		  
		  
	  });
	///////////generate graph
	$("#generategraph").on('click',function(){
		 $("#embed_graph").html("");
        $("#embed_graph").append('<div class="progress"  style="margin-right:150px;"> <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:100%"> </div> </div>');
		var type = $(this).attr("attr-val");
		var parameter = $("#relationname").val();

		$.get("graph_process.jsp",{flag:"attribute",attrib:parameter},attribResult);

		function attribResult(response)
		{		
			var t = response.trim();

			if(t==""){
				$("#embed_graph").html('');
				console.log("Reps empty graph process");
				 
				$(".callMeta").slideDown("slow");
				setTimeout(function(){ $(".callMeta").slideUp("slow"); }, 3000);
				
			}
			else
			{
				console.log("Reps"+response);
				if(response)
				{


					$("#attribVal").empty();
					$("#attribVal").append(response);
				}

				drawGraph();


			}



		}

		function drawGraph()
		{

			var attribGraphValue = document.getElementById('attribVal').innerHTML;
			var nodes=attribGraphValue.split("~")[0];
			var edges=attribGraphValue.split("~")[1];
			nodes=JSON.parse(nodes);
			edges=JSON.parse(edges);

			// create a network
			var container = document.getElementById("embed_graph");
			var data = {
					nodes: nodes,
					edges: edges
			};
			var options = {
					width: '550px',
					height: '400px',

					nodes:
					{shape:'dot'},

					edges:
					{
						arrows:{to:{enabled:true}},
						color: {inherit:'from'},
						smooth:{type: 'continuous'}
					},
					interaction:	  
					{
						tooltipDelay:120,
						hover:true,
						navigationButtons:true
					}

			};
			var network = new vis.Network(container, data, options);
		}


	});


	////////////////////Repoerts
	$(".ReportsLabel").hover(function(){

		console.log("Report on hover");
		$(this).css("text-decoration", "underline");
	}, function(){
		console.log("Report on hover off");
		$(this).css("text-decoration", "");

	});
///////////////////////////////////


	//////////////////////question mark
	$(".glyphicon-question-sign").on('click',function(){
		console.log("ques");
		$(".alert").show();


	});


	//////////////////////addusertab
	$("#AddUserTab").on('click',function(){
		console.log("AddUserTab");
		/*  $("#config").hide(); 
		  $("#UserDb").hide();*/
		$(".act").hide();
		$("#addUser").fadeIn("slow");


	});
/////////////////////////////////////////

	////////////////AddUserBtn_close
	$("#AddUserBtn_close").on('click',function(){
		console.log("AddUserTab");
		$("#addUser").hide();
		console.log("88888888888"+$('#Act_Tab').val())
		 var act = $("#Act_Tab").val();
		console.log("Act_Tab"+act);
		$("#"+act).fadeIn("slow"); 

	});


	/////////////////////////configTab
	$("#configTab").on('click',function(){
		console.log("AddUserTab");
		/*  $("#addUser").hide();$("#UserDb").hide();*/
		$(".act").hide();
		
		
		$("#config").fadeIn("slow");


	});
///////////////////////////////////////////	  

	////////////////configTab_close
	$("#configTab_close").on('click',function(){
		console.log("configTab");
		console.log("9999999"+$('#Act_Tab').val())
		 var act = $("#Act_Tab").val();
		console.log("Config_Tab"+act);
		$("#config").fadeOut("slow");
		$("#"+act).show();

	});
///////////////////////////////////////	  

	//////////////////////slectall

	$("#SelectAll").on('click',function(){
		$("input:checkbox").prop('checked', true);


	});

	$("#applyReset").on('click',function(){

		$("input:checkbox").prop('checked', false);

	});
/////////////////////////////////////////

	///////////////select user
	$("#sel1").on('change',function(){

		var usr = $(this).val();
		if(usr =="Select User"){
			console.log(111);
			$("#applychanges").css("opacity",.5);
			$("#applychanges").attr("disabled","disabled");
			$("input:checkbox").prop('checked', false);

		}else{
			$("#applychanges").css("opacity",1);
			$("#applychanges").removeAttr("disabled");

			//////////////////--------------------/////////
///////////////admin change 


			var usr = $(this).val();
			///////send to ajax
			///////////////
			$(".container12").empty();
			$.ajax({

				url : "Universal",
				type:"POST",
				data:{module:"selectuser",usr:usr},

				success : function(responseText) {

					var f=responseText.trim(); 
					console.log("empty container12");

					$(".container12").html("");
					$(".container12").html(responseText);

					console.log("Bhart"+responseText);

					/////////////////////////////////
					$(".ReportsLabel").hover(function(){

						console.log("Report on hover");
						$(this).css("text-decoration", "underline");
					}, function(){
						console.log("Report on hover off");
						$(this).css("text-decoration", "");

					});
					////////////////////////////////////////
					///////////////////////////accordian

					var acc = document.getElementsByClassName("accordion");
					var i;

					for (i = 0; i < acc.length; i++) {
						acc[i].onclick = function() {
							this.classList.toggle("active");
							var panel = this.nextElementSibling;
							if (panel.style.maxHeight){
								panel.style.maxHeight = null;
							} else {
								panel.style.maxHeight = panel.scrollHeight + "px";
							} 
						}
					}
					//////////////////////////////////////////

				}
			});
			//////////////	  
			//////////////ajax end


			//////////-------------/////////////////	
		}








	});

	////////////////////HOME
	$(".test").click(function(){
		$(".act").hide();
		console.log("test");
		$("#test").show("slow");

	});
	
	
	////////////////////METADATA
	$(".METADATA").click(function(){
		$(".act").hide();
		$("#Act_Tab").attr("value","");
		 $("#Act_Tab").attr("value","UserDb");
		console.log("Medatdat reports");
		$("#UserDb").show("slow");

	});


	//////////////////home
	$(".home").click(function(){
		$(".act").hide();
		$("#addUser").hide();
		$("#config").hide();
		$("#UserDb").hide();
		//$("#adminReports").show("slow");

	});


	//////////////////provider
	$(".MEMBER").click(function(){
		$(".act").hide();
		$("#Act_Tab").attr("value","");
		 $("#Act_Tab").attr("value","adminReports");
		 
		console.log("admin reports");
		$("#adminReports").show("slow");

	});
	
	
	$(".MEMBER").click(function(){
		$(".act").hide();
		$("#Config_Tab").attr("value","");
		 $("#Config_Tab").attr("value","adminReports");
		 
		console.log("admin reports");
		$("#adminReports").show("slow");

	});

	//////////////////provider
	$(".PROVIDER").click(function(){
		$(".act").hide();
		$("#Act_Tab").attr("value","");
		 $("#Act_Tab").attr("value","provider");
		$("#provider").show("slow");

	});


	$(".CLAIM").click(function(){
		$(".act").hide();
		$("#Act_Tab").attr("value","");
		 $("#Act_Tab").attr("value","claims");
		$("#claims").show("slow");

	});

	//////////////////provider
	$(".POPULATION_HEALTH").click(function(){
		$(".act").hide();
		$("#Act_Tab").attr("value","");
		 $("#Act_Tab").attr("value","population");
		$("#population").show("slow");

	});


////////////////////////////////////////////////adduserbtn
	$("#AddUserBtn").click(function(){
		///////get user add details
		console.log("btn for user");
		var usr =$("#usrname").val();
		var pass = $("#psw").val();
		var pass1 = $("#psw1").val();

		if( (usr === "") || (pass === "") || (pass1 === "") ){
			console.log("usr null");
			$("#h5usr").text("");
			$("#h5usr").text("Fields cannot be empty");
		}
		else{
			console.log("not all");
			///do validations 


			if( !validateEmail(usr)) {
				console.log("invalid email");
				$("#h5usr").text("");
				$("#h5usr").text("Please provide valid email !");
				$("#usrname").val(''); 
				$("#usrname").focus();
				return false;

			}else{

				console.log("valid email");


				if(pass1 == pass)
				{
					//valid
					console.log("go ahead");
					////////////////ajax
					///////////////
					$.ajax({

						url : "AddUsr",
						type:"POST",
						data:{usr:usr,pass:pass},

						success : function(responseText) {
							console.log("console"+responseText);
							var f=responseText.trim(); 
							if(f =="User Added"){
								//ye
								console.log("useradded");
								$("#h5usr").text("");
								//  $("#h5usr").text("User Added !");
								$(".calluser").slideDown("slow");
								setTimeout(function(){ $(".calluser").slideUp("slow"); }, 3000);
								$("input[type=text]").val('');
								$("input[type=password]").val('');
								/////////reflect changes to config
								///////////////
								$.ajax({

									url : "Universal",
									type:"POST",
									data:{module:"Updateuserlist"},

									success : function(responseText) {
										console.log("console"+responseText);
										var f=responseText.trim(); 
										$("#sel1").empty()
										.append(f);



									}
								});
								//////////////
								/////////////end reflect
							}else{
								//no
								console.log("found");
								$("#h5usr").text("");
								$("#h5usr").text("User already found !");
								$("input[type=text]").val('');
								$("input[type=password]").val('');
							}


						}
					});
					//////////////
					///////////////////ajax
				}
				else{
					//provide valid
					$("#errAdd").text('');
					$("#errAdd").text('Password doesn\'t match !');
				}
			}



			//////////////////
		}






	});
//////////////////////////////////adduser	

	//////////////////////////Apply changes
	$("#applychanges").on('click',function(){


		var usr =$('#sel1').val();

		console.log("applychanges"+usr);
		var favorite = [];
		$.each($("input[name='reports']:checked"), function(){            
			favorite.push($(this).val());
		});


		console.log("-------fav---------"+favorite);
		if(favorite.length == 0)
			var reports ="no";
		else
			var reports =  favorite.join(",");
		console.log(reports);

		/////////////ajsx
		///////////////
		$.ajax({

			url : "Universal",
			type:"POST",
			data:{module:"applychanges",usr:usr,reports:reports},

			success : function(responseText) {
				console.log("console"+responseText);
				var f=responseText.trim(); 
				/*
					    	$("#h5usrPerm").text("");
					    	$("#h5usrPerm").text("Changes applied !");
				 */

				/*$(".call").fadeTo(2000, 500).slideUp(500, function(){
					               $(".call").slideUp(500);
					                }); */
				$(".call").slideDown("slow");
				setTimeout(function(){ $(".call").slideUp("slow"); }, 3000);

			}
		});
		//////////////

		////////////////////////////////////ajax        
	});

/////////////////////////////////////////////////	    





});