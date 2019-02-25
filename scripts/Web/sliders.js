var params0 = ["Population", "Education", "Lifestyle"];
var params_ed = ["College","Grad","Ugrad","Patents"];
var params_li = ["Commute","Crime","Housing"];

//Helper function to find the sum of all parameter values
function get_sum_params(params){
  var sum = 0;
  for (j = 0; j < params.length; j++){
    sum += parseFloat(document.getElementById(params[j]).value);
    console.log(sum);
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
  var sum = get_sum_params(params);

  //Displaying normalized values
  for (i = 0; i < params.length; i++){
    var val = ((document.getElementById(params[i]).value/sum)*100).toFixed(2);
    document.getElementById(params[i]).value = val;
    document.getElementById(params[i].concat("_num")).innerHTML = params[i].concat(": ").concat(val).concat("%");
  }

  //Sending to Tableau
  if (viz){
    var slider = document.getElementById(param);
    submit_param(param,slider.value/100)
  }
}
