/**
 * 
 */
/**
 * 
 */
/**
 * 
 */
$(document).ready(function(){

	
	$("#kill").click(function(){
		console.log("kill bash");
		 $.ajax({
			url: "Bashkill",

			type: "get",
			data :{act:"stop"},
			 
			success: function(rep){
				console.log(rep); 
				var res = rep.trim();
				if(res == "stopped"){
					$.notify("Spark engine stopped", "success");
					
				}else{
					$.notify("No Spark engine to stop", "error");
				}
				
				

			} 
		});
		 
		
	});
	
	$("#start").click(function(){
		console.log("start bash"); 
		 $.ajax({
			url: "Bashkill",

			type: "get",
			data :{act:"start"},
			 
			success: function(rep){
				console.log(rep);
				var res = rep.trim();
				if(res == "started"){
					$.notify("Started spark engine sucessfully", "success");
					
				}else{
					$.notify("Engine already running", "error");
				}
				

			} 
		});
		 
		
	});
	
	 
	console.log("First load");

	 
	ChkajaxInitial("0");
	 


	///Filter//////////////////////
	$("#Filter").on('click',function(){
		 
		$("#load").show();

		console.log("ChkajaxInitial"+skip);
		 
		
		var date = $("#datepicker").val();
		var states = $("#state").val();
		var statess = states.split(",");
		var state = statess[0];
		var cities = $("#city").val();
		var citi = cities.split(",");
		var city = citi[0];
		console.log("City name::"+city);
		console.log("State name::"+state);
		var AddPurpose = $("#AddPurpose").val().trim();
		var TrackStateParam,TrackCityParam;
		var lmt1=skip;
		console.log(AddPurpose);
	 
		if (AddPurpose == "mail") {

			 
			TrackStateParam = "Provider_Business_Mailing_Address_State_Name";

			TrackCityParam = "Provider_Business_Mailing_Address_City_Name";

		} else {
			TrackStateParam ="Provider_Business_Practice_Location_Address_State_Name";
					

			TrackCityParam = "Provider_Business_Practice_Location_Address_City_Name";

		}
		
		//new ajax call to search parameters
		$.ajax({
            url: 'search',
            
            type: 'post',
            
            data:{date:date,state:state,city:city,TrackStateParam:TrackStateParam,TrackCityParam:TrackCityParam,lmt:lmt1}
		});
		
		
		//call to ajax
		 $.ajax({
                url: 'Chk1.jsp',
                
                type: 'POST',
                
                data:{date:date,state:state,city:city,TrackStateParam:TrackStateParam,TrackCityParam:TrackCityParam,lmt:lmt1},
                success: function(rep){
                    
                	var res = rep.trim();
                	console.log("Response len "+res.length);
    /*             	
                	if(res.length == 0){
 	               		///load again
                		//$("#mainContent").html("");
                		//skip = skip+1;
                		var currentskip = $("#btnLoop").attr("attr-loop") ;
                		ChkajaxInitial(currentskip);
                		var skip1=parseInt(currentskip)+1;
                		
                		console.log("res is 0 so checking again"+ skip1);
                		$("#btnLoop").attr("attr-loop","") ;
                		$("#btnLoop").attr("attr-loop",skip1) ;
                		
                	}*/
                	if(res == 'limitexceed'){

               		 $("#load").hide();

                		var h = "<div class='alert alert-danger alert-dismissible'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> No more record found ! </div>";
                		$(".showerr").html('');
                		$(".showerr").append(h);
                		setTimeout(function(){$(".showerr").html('')},3000);
                	 	
                	}
                	               	
                	else{

               		 $("#load").hide();

                		/*console.log("Skip Function "+skip);
                		 if(skip == "0")*/
                			$("#mainContent").html("");
                		
                      $("#mainContent").append(rep);
                    
                      
              		
                    /* $("#mainContent").append('<div class="col-sm-12 col-sm-offset-5">'+
                    		 '<button type="button" attr-loop="0" class="btn btn-primary btn-lg LM">Load more</button>'+
                    		 '</div>');*/
                	}
                } 
            });
		
		 $("#btnLoop").attr("attr-loop","") ;
			$("#btnLoop").attr("attr-loop",parseInt(skip)+1) ;
		//ChkajaxInitial("0");
	/*	
	*/	

	});



	//$("boby").onclick(function(){
	$('body').on('click','.cf',function(){
		console.log("my modal");
		var npi;
		npi = $(this).attr("attr-npi");
		console.log(npi);
		$("#h1npi").html('');
		$("#h1npi").html(npi);
		//$('#myModal').modal();
		//get npi id from nodel

		//call to ajax
		$.ajax({
			url: "TrackHistory1",

			type: "post",

			data:{npi:npi},
			success: function(rep){
				console.log(rep);
				$("#resTrackHistory").html('');
				$("#resTrackHistory").append(rep);

			} 
		});


	}); 

	////load button click
	$('body').on('click','.LM',function(){
		
		var loopcount;
		loopcount = $(this).attr("attr-loop");
		console.log(loopcount);
		//send lmt to function
		
		ChkajaxInitial(loopcount);
		console.log("Button LM click"+loopcount);
		 
		 


	}); 
	
	
	
	
	
	
	///get npi dates

 	$( function() {

		$( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' }).on('change', function(){
			var dates =$("#datepicker").val();
			console.log(dates);

		});;
	} );  
 

	////Showallnpis
	$("#Showallnpis").click(function(){
		location.reload();

	});

	$(".navbar-brand").click(function(){

		//location.reload();
	});



	$("#SrchNpi").click(function(){

		var npi = $("#NPI").val();
		console.log(npi);
		var npilength = npi.trim().length;
		console.log(npilength);

		if(npilength >= 10){

			$.ajax({
				url: 'GetNpiRec2.jsp',

				type: 'post',

				data:{npi:npi},
				success: function(rep){
					var tr = rep.trim();
					console.log("reaponse"+tr);
					if(!tr == ""){
						$("#mainContent").html('');
						$("#mainContent").append(tr);

					}else{
						document.getElementById("snackbarnotchanged").innerHTML = "Data is Upto Date for the NPI= "+npi  ;
						var x = document
						.getElementById("snackbarnotchanged")

						x.className = "show";
						setTimeout(
								function() {
									x.className = x.className
									.replace(
											"show",
									"");
								},
								3000);


					}           
				} 
			});
		}else{


			var x = document
			.getElementById("snackbar")

			x.className = "show";
			setTimeout(
					function() {
						x.className = x.className
						.replace(
								"show",
						"");
					},
					3000);
		} 

	});

 
	////////////////////////////
 
////
function ChkajaxInitial(skip){
	 
	$("#load").show();

		console.log("ChkajaxInitial"+skip);
		 
		
		var date = $("#datepicker").val();
		var states = $("#state").val();
		var statess = states.split(",");
		var state = statess[0];
		var cities = $("#city").val();
		var citi = cities.split(",");
		var city = citi[0];
		console.log("City name::"+city);
		console.log("State name::"+state);
		var AddPurpose = $("#AddPurpose").val().trim();
		var TrackStateParam,TrackCityParam;
		var lmt1=skip;
		console.log(AddPurpose);
	 
		if (AddPurpose == "mail") {

			 
			TrackStateParam = "Provider_Business_Mailing_Address_State_Name";

			TrackCityParam = "Provider_Business_Mailing_Address_City_Name";

		} else {
			TrackStateParam ="Provider_Business_Practice_Location_Address_State_Name";
					

			TrackCityParam = "Provider_Business_Practice_Location_Address_City_Name";

		}
		
		//new ajax call to search parameters
		$.ajax({
            url: 'search',
            
            type: 'post',
            
            data:{date:date,state:state,city:city,TrackStateParam:TrackStateParam,TrackCityParam:TrackCityParam,lmt:lmt1}
		});
		
		
		//call to ajax
		 $.ajax({
                url: 'Chk.jsp',
                
                type: 'post',
                
                data:{date:date,state:state,city:city,TrackStateParam:TrackStateParam,TrackCityParam:TrackCityParam,lmt:lmt1},
                success: function(rep){
                    
                	var res = rep.trim();
                	console.log("Response len "+res.length);
                 	
                	if(res.length == 0){
 	               		///load again
                		//$("#mainContent").html("");
                		//skip = skip+1;
                		var currentskip = $("#btnLoop").attr("attr-loop") ;
                		ChkajaxInitial(currentskip);
                		var skip1=parseInt(currentskip)+1;
                		
                		console.log("res is 0 so checking again"+ skip1);
                		$("#btnLoop").attr("attr-loop","") ;
                		$("#btnLoop").attr("attr-loop",skip1) ;
                		
                	}
                	if(res == 'limitexceed'){

               		 $("#load").hide();

                		var h = "<div class='alert alert-danger alert-dismissible'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> No more record found ! </div>";
                		$(".showerr").html('');
                		$(".showerr").append(h);
                		setTimeout(function(){$(".showerr").html('')},3000);
                	 	
                	}
                	               	
                	else{

               		 $("#load").hide();

                		console.log("Skip Function "+skip);
                		 if(skip == "0")
                			$("#mainContent").html("");
                		
                      $("#mainContent").append(rep);
                    
                      
              		
                    /* $("#mainContent").append('<div class="col-sm-12 col-sm-offset-5">'+
                    		 '<button type="button" attr-loop="0" class="btn btn-primary btn-lg LM">Load more</button>'+
                    		 '</div>');*/
                	}
                } 
            });
		
		 $("#btnLoop").attr("attr-loop","") ;
			$("#btnLoop").attr("attr-loop",parseInt(skip)+1) ;
		 
	}
	
	
});


//Autocomplete code for state name
  $( function() {
		 var availableTags = [
			 "AK, ALASKA", 
			 "AL, ALABAMA",
			 "AR, ARKANSAS",
			 "AS, AMERICAN SAMOA",
			 "AZ, ARIZONA",
			 "CA, CALIFORNIA ",
			 "CO, COLORADO ",
			 "CT, CONNECTICUT", 
			" DC, DISTRICT OF COLUMBIA", 
			 "DE, DELAWARE ",
			 "FL, FLORIDA ",
			 "FM, MICRONESIA, FEDERATED STATES OF",
			 "GA, GEORGIA ",
			 "GU, GUAM ",
			 "HI, HAWAII ",
			 "IA, IOWA ",
			 "ID, IDAHO ",
			 "IL, ILLINOIS", 
			 "IN, INDIANA ",
			 "KS, KANSAS ",
			 "KY, KENTUCKY ",
			 "LA, LOUISIANA ",
			 "MA, MASSACHUSETTS",
			 "MD, MARYLAND", 
			 "ME, MAINE ",
			 "MH, MARSHALL ISLANDS", 
			 "MI, MICHIGAN ",
			 "MN, MINNESOTA ",
			 "MO, MISSOURI ",
			 "MP, MARIANA ISLANDS, NORTHERN", 
			 "MS, MISSISSIPPI", 
			 "MT, MONTANA ",
			" NC, NORTH CAROLINA", 
			" ND, NORTH DAKOTA", 
			" NE, NEBRASKA ",
			" NH, NEW HAMPSHIRE",
			" NJ, NEW JERSEY ",
			" NM, NEW MEXICO", 
			" NV, NEVADA ",
			" NY, NEW YORK", 
			 "OH, OHIO ",
			 "OK, OKLAHOMA ",
			 "OR, OREGON ",
			 "PA, PENNSYLVANIA ",
			 "PR, PUERTO RICO", 
			 "PW, PALAU ",
			 "RI, RHODE ISLAND ",
			 "SC, SOUTH CAROLINA ",
			 "SD, SOUTH DAKOTA", 
			" TN, TENNESSEE", 
			" TX, TEXAS ",
			" UT, UTAH ",
			" VA, VIRGINIA ",
			" VI, VIRGIN ISLANDS", 
			" VT, VERMONT ",
			" WA, WASHINGTON "
	     
	    ];
	    

		
	    $( "#state").autocomplete({
	      source: availableTags
	    });
	  } );
  
  //auto complete code for the country code

  $( function() {
		 var availableTags = [
			 
			" AD, ANDORRA"," AE, UNITED ARAB EMIRATES","AF, AFGHANISTAN","AG, ANTIGUA AND BARBUDA","AI, ANGUILLA"," AL, ALBANIA"," AM, ARMENIA"," AN, NETHERLANDS ANTILLES",
			 "AO, ANGOLA"," AQ, ANTARCTICA"," AR, ARGENTINA"," AT, AUSTRIA"," AU, AUSTRALIA"," AW, ARUBA"," AX, ALAND ISLANDS","AZ, AZERBAIJAN","BA, BOSNIA AND HERZEGOVINA",
			 "BB, BARBADOS"," BD, BANGLADESH"," BE, BELGIUM","BF, BURKINA FASO"," BG, BULGARIA","BH, BAHRAIN"," BI, BURUNDI"," BJ, BENIN"," BM, BERMUDA","BN, BRUNEI DARUSSALAM",
			 "BO, BOLIVIA"," BR, BRAZIL"," BS, BAHAMAS","BT, BHUTAN"," BV, BOUVET ISLAND"," BW, BOTSWANA","BY, BELARUS","BZ, BELIZE","CA, CANADA","CC, COCOS (KEELING) ISLANDS",
			 "CD, CONGO, THE DEMOCRATIC REPUBLIC OF THECF, CENTRAL AFRICAN REPUBLIC","CG, CONGO"," CH, SWITZERLAND"," CI, CÔTE D'IVOIRE","CK, COOK ISLANDS"," CL, CHILE",
			 "CM, CAMEROON","CN, CHINA","CO, COLOMBIA","CR, COSTA RICA","CS, SERBIA AND MONTENEGRO","CU, CUBA","CV, CAPE VERDE","CX, CHRISTMAS ISLAND","CY, CYPRUS",
			 "CZ, CZECH REPUBLIC"," DE, GERMANY"," DJ, DJIBOUTI"," DK, DENMARK"," DM, DOMINICA","DO, DOMINICAN REPUBLIC","DZ, ALGERIA","EC, ECUADOR","EE, ESTONIA","EG, EGYPT",
			 "EH, WESTERN SAHARA"," ER, ERITREA"," ES, SPAIN"," ET, ETHIOPIA"," FI, FINLAND"," FJ, FIJI","FK, FALKLAND ISLANDS (MALVINAS)","FO, FAROE ISLANDS","FR, FRANCE",
			 "GA, GABON"," GB, GREAT BRITAIN (UK)","GD, GRENADA","GE, GEORGIA","GF, FRENCH GUIANA","GG, GUERNSEY"," GH, GHANA","GI, GIBRALTAR","GL, GREENLAND","GM, GAMBIA",
			 "GN, GUINEA"," GP, GUADELOUPE","GQ, EQUATORIAL GUINEA"," GR, GREECE"," GS, SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS"," GT, GUATEMALA","GW, GUINEA-BISSAU",
			 "GY, GUYANA"," HK, HONG KONG","HM, HEARD ISLAND AND MCDONALD ISLANDS"," HN, HONDURAS","HR, CROATIA"," HT, HAITI"," HU, HUNGARY","ID, INDONESIA","IE, IRELAND",
			 "IL, ISRAEL"," IM, ISLE OF MAN","IN, INDIA","IO, BRITISH INDIAN OCEAN TERRITORY","IQ, IRAQ","IR, IRAN, ISLAMIC REPUBLIC OF","IS, ICELAND","IT, ITALY",
			 "JE, JERSEY","JM, JAMAICA","JO, JORDAN","JP, JAPAN","KE, KENYA","KG, KYRGYZSTAN","KH, CAMBODIA","KI, KIRIBATI","KM, COMOROS","KN, SAINT KITTS AND NEVIS",
			 "KP, KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF"," KR, KOREA, REPUBLIC OF","KW, KUWAIT"," KY, CAYMAN ISLANDS","KZ, KAZAKHSTAN","LA, LAO PEOPLE'S DEMOCRATIC REPUBLIC",
			 "LB, LEBANON","LC, SAINT LUCIA"," LI, LIECHTENSTEIN"," LK, SRI LANKA","LR, LIBERIA","LS, LESOTHO","LT, LITHUANIA","LU, LUXEMBOURG","LV, LATVIA","LY, LIBYAN ARAB JAMAHIRIYA",
			 "MA, MOROCCO","MC, MONACO"," MD, MOLDOVA, REPUBLIC OF"," MG, MADAGASCAR"," ML, MALI"," MM, MYANMAR"," MN, MONGOLIA"," MO, MACAO","MQ, MARTINIQUE","MR, MAURITANIA",
			 "MS, MONTSERRAT"," MT, MALTA","MU, MAURITIUS","MV, MALDIVES"," MW, MALAWI","MX, MEXICO"," MY, MALAYSIA","MZ, MOZAMBIQUE"," NA, NAMIBIA"," NC, NEW CALEDONIA"," NE, NIGER",
			 "NF, NORFOLK ISLAND"," NG, NIGERIA"," NI, NICARAGUA"," NL, NETHERLANDS"," NO, NORWAY","MK, MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF","NP, NEPAL","NR, NAURU",
			 "NU, NIUE","NZ, NEW ZEALAND"," OM, OMAN"," PA, PANAMA"," PE, PERU","PF, FRENCH POLYNESIA","PG, PAPUA NEW GUINEA"," PH, PHILIPPINES","PK, PAKISTAN","PL, POLAND",
			 "PM, SAINT PIERRE AND MIQUELON"," PN, PITCAIRN","PS, PALESTINIAN TERRITORY, OCCUPIED","PT, PORTUGAL","PY, PARAGUAY","QA, QATAR","RE, REUNION","RO, ROMANIA","RU, RUSSIAN FEDERATION",
			 "RW, RWANDA","SA, SAUDI ARABIA","SB, SOLOMON ISLANDS","SC, SEYCHELLES","SD, SUDAN","SE, SWEDEN"," SG, SINGAPORE"," SH, SAINT HELENA"," SI, SLOVENIA","SJ, SVALBARD AND JAN MAYEN",
			 "SK, SLOVAKIA"," SL, SIERRA LEONE","SM, SAN MARINO","SN, SENEGAL","SO, SOMALIA","SR, SURINAME","ST, SAO TOME AND PRINCIPE","SV, EL SALVADOR","SY, SYRIAN ARAB REPUBLIC",
			 "SZ, SWAZILAND","TC, TURKS AND CAICOS ISLANDS","TD, CHAD","TF, FRENCH SOUTHERN TERRITORIES","TG, TOGO"," TH, THAILAND","TJ, TAJIKISTAN","TK, TOKELAU","TL, TIMOR-LESTE",
			 "TM, TURKMENISTAN "," TN, TUNISIA","TO, TONGA","TR, TURKEY","TT, TRINIDAD AND TOBAGO","TV, TUVALU","TW, TAIWAN","TZ, TANZANIA, UNITED REPUBLIC OF","UA, UKRAINE",
			 "UG, UGANDA"," UM, UNITED STATES MINOR OUTLYING ISLANDS"," US, UNITED STATES","UY, URUGUAY","UZ, UZBEKISTAN","VA, HOLY SEE (VATICAN CITY STATE)","VC, SAINT VINCENT AND THE GRENADINES",
			 "VE, VENEZUELA","VG, VIRGIN ISLANDS, BRITISH","VN, VIET NAM"," VU, VANUATU","WF, WALLIS AND FUTUNA"," WS, SAMOA","YE, YEMEN","YT, MAYOTTE","ZA, SOUTH AFRICA","ZM, ZAMBIA",
			"ZW, ZIMBABWE"
		     
			    ];
			    

				
			    $( "#city").autocomplete({
			      source: availableTags
			    });
			  } );