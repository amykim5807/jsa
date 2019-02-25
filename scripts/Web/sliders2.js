var params0 = ["Population", "Education", "Lifestyle"];
var params_ed = ["College","Grad","Ugrad","Patents"];
var params_li = ["Commute","Crime","Housing"];

//Helper function to find the sum of all parameter values
function get_sum_params(param,params){
  var sum = 0;
  for (j = 0; j < params.length; j++){
    if (params[j] != param){
      sum += parseFloat(document.getElementById(params[j]).value);
      console.log(sum);
    }
  }
  return sum;
}

//Function to change a parameter value (using sliders)
function change_val(param,opt=0) {
  var params;
  if (opt==1) {
    params = params_ed
  }else if (opt==2) {
    params = params_li
  }else {
    params = params0
  }
  var sum = get_sum_params(param,params);
  var main_val = document.getElementById(param).value;

  //Displaying normalized values
  for (i = 0; i < params.length; i++){
    //Regular parameter
    if (params[i] != param){
      var val = ((document.getElementById(params[i]).value/sum)*(100-main_val)).toFixed(0);
      document.getElementById(params[i]).value = val;
      document.getElementById(params[i].concat("_num")).innerHTML = params[i].concat(": ").concat(val).concat("%");
    }
    //Specific parameter we're looking for
    else{
      document.getElementById(params[i].concat("_num")).innerHTML = params[i].concat(": ").concat(main_val).concat("%");
    }
  }

  //Sending to Tableau
  if (viz){
    var slider = document.getElementById(param);
    submit_param(param,slider.value/100)
  }
}
