<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exahealth-Sentiment Analysis</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
   
   <!-- Charts -->
         <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.js" type="text/javascript"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.min.js" type="text/javascript"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.js" type="text/javascript"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.min.js" type="text/javascript"></script>
    <!-- Charts -->
    
    <!-- jqcloud 
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jqcloud/1.0.4/jqcloud-1.0.4.min.js"></script>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqcloud/1.0.4/jqcloud.css">
       
   jqcloud -->
    
     <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.12.2/d3.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.12.2/d3.min.js"></script>
       
       
    
    <!-- highcharts  
     <script src="https://code.highcharts.com/highcharts.js"></script>
     <script src="https://code.highcharts.com/modules/wordcloud.js"></script>
     highcharts -->
       
         <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.js"></script>

  
  
  <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet" type="text/css" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.css" rel="stylesheet" type="text/css" />
  
  <!-- load D3js -->
<script src="//d3plus.org/js/d3.js"></script>

<!-- load D3plus after D3js -->
<script src="//d3plus.org/js/d3plus.js"></script>
    
</head>
<style>
.blueGradient
{
  position: relative;
    color:white;
    
    text-align: left;
    height: auto; 
    background: -moz-linear-gradient(270deg, rgba(0,168,240,1) 0%, rgba(94,206,255,1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0,168,240,1)), color-stop(100%, rgba(94,206,255,1)));
    background: -webkit-linear-gradient(270deg, rgba(0,168,240,1) 0%, rgba(94,206,255,1) 100%);
    background: linear-gradient(180deg, rgba(0,168,240,1) 0%, rgba(94,206,255,1) 100%);
    overflow:hidden;
}

.blueGradientTable
{
  position: relative;
    color:white;
    
    text-align: left;
    height: auto; 
    background: -moz-linear-gradient(150deg, rgba(0,168,240,1) 0%, rgba(94,206,255,1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0,168,240,1)), color-stop(100%, rgba(94,206,255,1)));
    background: -webkit-linear-gradient(150deg, rgba(0,168,240,1) 0%, rgba(94,206,255,1) 100%);
    background: linear-gradient(180deg, rgba(0,168,240,1) 0%, rgba(94,206,255,1) 100%);
    overflow:hidden;
}
.greenGradient
{
  position: relative;
    color:white;
    
    text-align: left;
    height: auto; 
    background: -moz-linear-gradient(270deg, rgba(23,186,177,1) 0%, rgba(27,216,206,1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(23,186,177,1)), color-stop(100%, rgba(27,216,206,1)));
    background: -webkit-linear-gradient(270deg, rgba(23,186,177,1) 0%, rgba(27,216,206,1) 100%);
    background: linear-gradient(180deg, rgba(23,186,177,1)) 0%, rgba(27,216,206,1) 100%);
    overflow:hidden;
}

body.modal-open .background-container{
    -webkit-filter: blur(4px);
    -moz-filter: blur(4px);
    -o-filter: blur(4px);
    -ms-filter: blur(4px);
    filter: blur(4px);
    filter: url("https://gist.githubusercontent.com/amitabhaghosh197/b7865b409e835b5a43b5/raw/1a255b551091924971e7dee8935fd38a7fdf7311/blur".svg#blur);
filter:progid:DXImageTransform.Microsoft.Blur(PixelRadius='4');
}
</style>
<script type="text/javascript">


var graph=null;
var ishash;
var twitter_srch;

var nodes="";
var edges="";

var tweet_msg;
function get_topic()
{
	  document.getElementById('progress').innerHTML='<br><div class="container"><div class="progress" style="width:50%"><div class="progress-bar progress-bar-striped progress-bar-animated" style="width:100%"></div></div></div>';
	  document.getElementById("all_results").style.visibility="hidden";	
	 topic=$("#twsearch").val();
	 twitter_srch=topic;
	if(topic.substring(0,1)=="#")
		{
		 ishash="yes"
		 topic=topic.split("#")[1]
		  
		}
	else
		{
		 ishash="no"
		}
	
	$.get("http://52.168.71.84:5122/tw_senti",{topic:topic},tw_result)
	
}
function tw_result(response)
{
	if(response)
		{
		  $("#resp_values").empty();
		  $("#resp_values").append(response);
		  senti_graph_disp();
		  document.getElementById('progress').innerHTML='';
		  document.getElementById("all_results").style.visibility="visible";
		  
		//document.getElementById('wc').innerHTML=''
		//document.getElementById('wc_title').innerHTML=" Word Cloud for :  "+twitter_srch
		//wc_disp();
		}
	
}

function wc_disp()66
{
	var words= [{"text":"aaa","weight":12},
	            {"text":"bbb","weight":55},{"text":"ccc","weight":5}];
	//$('#wc').jQCloud(words, { autoResize: true});
	
}



function senti_graph_disp()
{
	
	//document.getElementById('only_hash_srch').innerHTML=''
	if(ishash=="no")
	{document.getElementById('for_at_count').innerHTML='<div class="card" >'+
             '<div class="card-body">'+
             '<h6 class="card-title">Topic Overview</h6>'+
              '154834'+
             '</div>'+
              '</div><br><Br>';
	}
	var values=document.getElementById('resp_values').innerHTML;
	
	$("#senti_graph").remove();
	$('#senti_graph_div').append('<canvas id="senti_graph" width="200" height="130"><canvas>')
	var context=$("#senti_graph");
	
	var yval=[]
	
	var total=[]
	total =values.split("~"); //tilde based kv pairs
	for(i=0;i<3;i++)//i= 0,1,2 for sentiment res //for(i=0;i<total.length;i++)
		{
		//alert(total[i])
		 var kv=[];
		 kv=total[i].split(":");
		 yval.push(parseInt(kv[1]))
		}
	   
	   var word_phrase=[];
	   var count_phrase=[];
	   
	   for(i=3;i<5;i++)//i=3,4 for most common phrase
	   {
		   var kv=[];
		   kv=total[i].split(":")[1];
		   if(i==3)
			    {
			     var kv_ph=kv.split(",");
			     for(j=0;j<kv_ph.length;j++)
			    	 {
			    	  word_phrase.push(kv_ph[j])
			    	 }
			    }
		   else if(i==4)
			   {
			    var kv_ph=kv.split(",");
			     for(j=0;j<kv_ph.length;j++)
			    	 {
			    	  count_phrase.push(parseInt(kv_ph[j]))
			    	 }
			   }
		  // alert(word_phrase)
		  // alert(count_phrase)
	   }
	   
	   var usr_name=[];
	   var count_usr=[]
	   
	      //i=5,6 for most freq users
	      for(i=5;i<7;i++)
	      {
	    	  var kv=[];
			   kv=total[i].split(":")[1];
			   if(i==5)
				    {
				     var kv_usr=kv.split(",");
				     for(j=0;j<kv_usr.length;j++)
				    	 {
				    	 usr_name.push(kv_usr[j])
				    	 }
				    }
			   else if(i==6)
				   {
				    var kv_usr=kv.split(",");
				     for(j=0;j<kv_usr.length;j++)
				    	 {
				    	 count_usr.push(parseInt(kv_usr[j]))
				    	 }
				   }  	  
	   	  }
		     //i=7 for emotion count
		     var kv=total[7].split(":")[1]
		     var kv_emo=kv.split(",");
		     document.getElementById("emo_fear").innerHTML=kv_emo[0];
		     document.getElementById("emo_joy").innerHTML=kv_emo[1];
		     document.getElementById("emo_sad").innerHTML=kv_emo[2];
		     document.getElementById("emo_surprise").innerHTML=kv_emo[3];
		     
		     //i=8,9 for nodes and edges
		   //  var nodes=""
		     //var edges=""
		     for(i=8;i<10;i++)
		    	 {
		    	 var kv=[];
				   kv=total[i].split("`")[1];
				   if(i==8)
					   {
					   nodes=JSON.parse(kv)//JSON.parse(kv)
					   }
				   else if(i==9)
					   {
					    edges=JSON.parse(kv)//JSON.parse(kv)
					   }
		    	 }
		     //i=10 for tweets text
		     for(i=10;i<11;i++)
		     {
		       var kv=[];
		       kv=total[i].split("`")[1];
		       if(i==10)
		    	   {
		    	   $("#twt_text").empty();
		    	   // alert(JSON.parse(kv));
		    	     tweet_msg=kv;
		    	     $("#twt_text").append(tweet_msg);
		    	    
		  		//    document.getElementById("twt_text").innerHTML=JSON.parse(kv);
		  		//  tweet_msg= document.getElementById("twt_text").innerHTML;
		  		  
		    	   }
		     }
 		     
		    // alert(nodes)
		   //  alert(edges)
		     
	var chart_data={
		    labels: ["Positive","Negative","Neutral"],
		    datasets: [
		        {
		            label: "No of tweets ",
		            backgroundColor:["#00ba38","#ff64b0","#de8c00"], 
			        data: yval
		        }
		    ]
		};
	var chart=new Chart(context,
			{
		      type : 'bar',
		      data : chart_data,
		      animation:{
		    	  animateScale:true
		      },
		      options:{
		    	  maintainAspectRatio: true,
		    	  responsive:true,
		    	  showTooltips: false,
		          
		    	  scales:
	            	{
	            	 xAxes:[{
	            		 display: true,
	            		 gridLines:
	            			 {
	            			  display:false
	            			 }
	            	         }]
	            	 }
	               }
			}
			);
	chart_data='';
	
phrase_graph_disp(word_phrase,count_phrase);
user_graph_disp(usr_name,count_usr);
//network_graph(nodes,edges);
network_graph();
document.getElementById("resp_values").innerHTML='';
}

function network_graph()
{
	
	$("#senti_ntwk_graph").remove();
	$('#senti_ntwk_graph_div').append('<div id="senti_ntwk_graph" width="500" height="30"></div>')
	
	var container = document.getElementById('senti_ntwk_graph');
	//var nodes= new vis.DataSet(nodes)
	//var edges= new vis.DataSet(edges)
   // var data= { nodes: nodes, edges: edges,  };
    var options = {
      width: '750px',
      height: '500px',
      layout: {improvedLayout:false},
      smoothCurves: {dynamic:false},
      hideEdgesOnDrag: true,
      stabilize: true,
     
    
     nodes:
    	  {shape:'dot',
    	 shapeProperties: {
     	    interpolation: false    // 'true' for intensive zooming
     	  }
    	 },
    interaction:	  
    	 {
    	  tooltipDelay:120,
    	  hover:true,
    	  navigationButtons:true
    	 },
    groups:
    	{
    	 positive: {color:{background: '#0BD318'}},
    	 negative: {color:{background: '#FF2A68'}},
    	 neutral: {color:{background: '#FFCD02'}}
    	}
    };
var network = new vis.Network(container, {}, options);
var data={nodes:nodes,edges:edges};
network.setData(data)
}

function phrase_graph_disp(word_phrase,count_phrase)
{
	$("#phrase_graph").remove();
	$('#phrase_graph_div').append('<canvas id="phrase_graph" width="200" height="130"><canvas>')
	var context=$("#phrase_graph");
	var ctx = document.getElementById("phrase_graph");
	ctx.style.backgroundColor = 'rgba(0,168,240,0)';
	var bgcol=[]//fill bgcolor for all bars
	for(i=0;i<15;i++)
		{
		 bgcol.push("rgba(255,255,255,0.6)")// bgcol.push("#1ab1f2")
		}
	document.getElementById("phr_title").innerHTML="Most Frequent phrases for "+twitter_srch;
	var chart_data={
		    labels: word_phrase,
		    datasets: [
		        {
		            label: "Phrase Frequency",
		            backgroundColor:bgcol, 
			        data: count_phrase
		        }
		    ]
		};
	//Chart.defaults.global.defaultFontColor = "white";
	var chart=new Chart(context,
			{
		      type : 'horizontalBar',
		      data : chart_data,
		      animation:{
		    	  animateScale:true
		      },
		      options:{
		    	  maintainAspectRatio: true,
		    	  responsive:true,
		    	  showTooltips: false,
		          scales:
	            	{
	            	 yAxes:[{
	            		 display: true,
	            		 gridLines:
	            			 {
	            			  display:false
	            			 },
	            			 ticks:
            	        	  {
            	        	    fontColor: "rgb(255,255,255)"
            	        	   }
	            	         }],
	            	         xAxes:[{
	    	            		 display: true,
	    	            		 gridLines:
	    	            			 {
	    	            			  display:false
	    	            			 },
	    	            			 ticks:
	                	        	  {
	                	        	    fontColor: "rgb(255,255,255)"
	                	        	   }
	    	            	         }]    
	            	 }
	         
	               }
			}
			);
	chart_data='';
}

function user_graph_disp(usr_name,count_usr)
{
	$("#user_graph").remove();
	$('#user_graph_div').append('<canvas id="user_graph" width="200" height="130"><canvas>')
	var context=$("#user_graph");
	var ctx = document.getElementById("user_graph");
	ctx.style.backgroundColor = 'rgba(0,168,240,0)';
	var bgcol=[]//fill bgcolor for all bars
	for(i=0;i<10;i++)// listing only top 10 users
		{
		 bgcol.push("rgba(255,255,255,0.6)")
		}
	document.getElementById("usr_title").innerHTML="Most Frequent users for "+twitter_srch;
	var chart_data={
		    labels: usr_name,
		    datasets: [
		        {
		        	label: "User Tweetcount",
		            backgroundColor:bgcol, 
			        data: count_usr
		        }
		    ]
		};
	var chart=new Chart(context,
			{
		      type : 'horizontalBar',
		      data : chart_data,
		      animation:{
		    	  animateScale:true
		      },
		      options:{
		    	  maintainAspectRatio: true,
		    	  responsive:true,
		    	  showTooltips: false,
		          scales:
	            	{
	            	 yAxes:[{
	            		 display: true,
	            		 gridLines:
	            			 {
	            			  display:false
	            			 },
	            			 ticks:
            	        	  {
            	        	    fontColor: "rgb(255,255,255)"
            	        	   }
	            	         }],
	            	         xAxes:[{
	    	            		 display: true,
	    	            		 gridLines:
	    	            			 {
	    	            			  display:false
	    	            			 },
	    	            			 ticks:
	                	        	  {
	                	        	    fontColor: "rgb(255,255,255)"
	                	        	   }
	    	            	         }]    
	            	 }
	              }
			}
			);
	chart_data='';
}

function show_data_table()
{
	  //  $('#twt_text').DataTable();
}

function initialise()
{
	document.getElementById("all_results").style.visibility="hidden";	
}
</script>

<body style="background-color:rgb(243,243,243)" onload="initialise()"">
<div class="row">
<nav id="top-bar" class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top" data-spy="affix" >
 <!-- <a class="navbar-brand" href="#">
    <img src="img/health-logo.png"  style="width:130px;height:60px;cursor:pointer;" >
  </a>-->
   <ul class="nav navbar-nav ml-auto">
    <li class="nav-item">
      <a class="nav-link" href="#about">About ExfHealth</a>
    </li>
           
    <li class="nav-item" style="background-color:white">
       <img src="img/nav-logo.png"   style="width:120px;cursor:pointer;" onclick="javascript:location.href='index.jsp'">
    </li>
  </ul>
</nav>
</div>
<br>
<br>
<hr align="center" width="50%">
<br><BR>
 <form class="form-inline" style="position:relative;left:10%">
             <input type="text" id="twsearch" placeholder="Topic to analyse. ex,#election etc." size="30" class="form-control">&nbsp;&nbsp;&nbsp;
             <input type="button" value="Analyse" class="btn btn-outline-info" onclick="get_topic()">
 </form>
 <div id="progress">
</div>
 <br>
 <div class="background-container" id="all_results">
<div class="container" style="margin:auto">
<div class="row">
   <div class="col-md-4">
            <!--<div class="card">
             <div class="card-body">
             <h4 class="card-title">Topic</h4>
             <form class="form-inline">
             <input type="text" id="twsearch" placeholder="#election,@IndianNewsCorp etc.." size="20" class="form-control">&nbsp;&nbsp;&nbsp;
             <input type="button" value="Analyse" class="btn btn-outline-info" onclick="get_topic()">
             </form>
             </div>
            </div>
            <br>-->
            <div class="card">
             <div class="card-body">
             <h4 class="card-title" >Sentiment Result</h4>&nbsp;
             <!-- input type='button' ' value='Show Tweets' onclick='show_data_table()' data-toggle='modal' data-target='#twt_modal' class='btn btn-outline-info btn-sm'>-->
             <br>
                <div id="senti_graph_div">
                  <canvas id="senti_graph" width="200" height="30"></canvas>
                </div>
             </div>
            </div>
            
            <br>
             <div class="card"  style="font-size:85%;height:600px;overflow-y:scroll;overflow-x:auto;">
             <div class="card-body">
             <h4 class="card-title" >Tweets</h4>&nbsp;<br>
             <div class="blueGradientTable"> <span id="twt_text" ></span></div>
             
             </div>
            </div>
            
            
   </div>
   <div class="col-md-8">
   <div id="for_at_count">
    <!-- only for @text search, counts like following, tweets and likes should appear.. not for #text search -->
    <!-- <div class="card" >
             <div class="card-body">
             <h6 class="card-title">Topic Overview</h6>
              55
             </div>
     </div>
    -->
     </div>
     
     <div class="card">
             <div class="card-body">
             <!-- <h6 class="card-title" id="wc_title">Word Cloud for topic</h6>
              <div id="wc" style="width:80%"></div>-->
              <h6 class="card-title" id="emo_title">Overall Emotional status  for topic</h6>
               <div class="row">
                <div class="col-sm-3"><a data-toggle="tooltip" data-placement="bottom" title="fear"><div  id="emo_fear" ></div>&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/fear.png" width="25" height="25"></a></div>
                <div class="col-sm-3"><a data-toggle="tooltip" data-placement="bottom" title="Joy"><div  id="emo_joy" style="width:25%"></div>&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/joy.png" width="25" height="25"></a></div>
                <div class="col-sm-3"><a data-toggle="tooltip" data-placement="bottom" title="Sad"><div id="emo_sad" style="width:25%"></div>&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/sad.png" width="25" height="25"></a></div>
                <div class="col-sm-3"><a data-toggle="tooltip" data-placement="bottom" title="Surprise"><div  id="emo_surprise" style="width:25%"></div>&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/surprise.png" width="45" height="25"></a></div>
               </div>
              </div>
     </div>
     
     <br>
     <div class="card" style="background-color:rgb(0,168,240);color:white;">
           <div class="blueGradient">
             <div class="card-body">
             <h4 class="card-title" ><div id="phr_title">Most frequent phrases for topic</div></h4>
              <div id="phr" style="width:80%">
                  <div id="phrase_graph_div">
                         <canvas id="phrase_graph" width="200" height="30"></canvas>
                </div>
              </div>
             </div>
         </div>    
     </div>
     <br>
     <div class="card"  >
        <div class="greenGradient">
             <div class="card-body">
             <h4 class="card-title" ><div id="usr_title">Most frequent Users for topic</div></h4>
              <div id="usr" style="width:80%">
                  <div id="user_graph_div">
                         <canvas id="user_graph" width="200" height="30"></canvas>
                </div>
              </div>
            </div>
        </div>   
     </div>
     
   </div>
  
   
  
   
</div>
<br>
<div class="row">
<div class="col-md-12">
<div class="card">
             <div class="card-body">
             <h4 class="card-title" >Sentiment Network</h4>
             <br>
                  <div class="row">
                                   <div class="col-sm-2 ">
                                      <div style="background-color:#0BD318;">&nbsp;&nbsp;</div>Positive
                                   </div>
                                   <div class="col-sm-2 ">
                                      <div style="background-color:#FF2A68;">&nbsp;&nbsp;</div>Negative
                                   </div>
                                   <div class="col-sm-2 ">
                                      <div style="background-color:#FFCD02;">&nbsp;&nbsp;</div>Neutral
                                   </div>
                   </div>               
             <br>
                <div id="senti_ntwk_graph_div">
                  <div id="senti_ntwk_graph" width="500" height="30"></div>
                </div>
             </div>
</div>

</div>
</div>

 </div> <!--  end container-->
 </div>
<div>
 <div id="resp_values" style="visibility: visible;"></div><br>
  <div id="tst" style="visibility: visible;"></div>
  
 
</div>


<!-- tweet modal -->
 <!--
  <div class="modal fade" id="twt_modal" style="background-color:rgba(255,255,255,0);">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
       
        <div class="modal-header" style="background-color:rgba(255,255,255,0);">
          <h4 class="modal-title">Tweets <i class="fa fa-twitter"></i></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
      
        <div class="modal-body" style="background-color:rgba(255,255,255,0);">
           <div class="blueGradientTable"> <span id="twt_text"></span></div>
        </div>
        
      </div>
    </div>
 </div>-->
  
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;© 2018. Exafluence, Inc. All Rights Reserved
</body>
</html>