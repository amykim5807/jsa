var params_short = ["Population", "Education", "Lifestyle"];
var params_long = []

//Loading tableau visualization on initial page load
function initViz() {
    var containerDiv = document.getElementById("vizContainer"),
        url = "http://public.tableau.com/views/WebsiteMap_4/overall",
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
function change_val(param,opt=0) {
  params = params_short
  //Full parameter options?
  if (opt){
    params = params_long
  }
  var sum = get_sum_params();

  //Displaying normalized values
  for (i = 0; i < params.length; i++){
    var val = ((document.getElementById(params[i]).value/sum)*100).toFixed(2);
    document.getElementById(params[i].concat("_num")).innerHTML = params[i].concat(": ").concat(val).concat("%");
  }

  //Sending to Tableau
  if (viz){
    var slider = document.getElementById(param);
    submit_param(param,slider.value/100)
  }
}
