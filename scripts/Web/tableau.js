var params = ["Population", "Education", "Lifestyle"];

//Loading tableau visualization on initial page load
function initViz() {
    var containerDiv = document.getElementById("vizContainer"),
        url = "http://public.tableau.com/views/JSA_V1_Reranked/V1_reranked_simple",
        options = {
            hideTabs: false,
            onFirstInteractive: function () {
                console.log("Viz has been loaded!");
            }
        };
    window.viz = new tableau.Viz(containerDiv, url, options);
}

//Function to submit parameter to Tableau server
function submit_param(param,val){
  viz.getWorkbook().changeParameterValueAsync(param, val).then(function (){ console.log('Parameter set');})
}

//Helper function to find the sum of all parameter values
function get_sum_params(){
  var sum = 0;
  for (j = 0; j < params.length; j++){
    sum += parseFloat(document.getElementById(params[j]).value);
    console.log(sum);
  }
  return sum;
}

//Function to change a parameter value (using sliders)
function change_val(param) {
  var sum = get_sum_params();
  
  //Displaying normalized values
  for (i = 0; i < params.length; i++){
    var val = (document.getElementById(params[i]).value/sum).toFixed(3)*100;
    document.getElementById(params[i].concat("_num")).innerHTML = params[i].concat(": ").concat(val).concat("%");
  }

  //Sending to Tableau
  if (viz){
    var slider = document.getElementById(param);
    submit_param(param,slider.value/100)
  }
}
