
//Loading tableau visualization on initial page load
function initViz() {
    var containerDiv = document.getElementById("vizContainer"),
        //url = "http://public.tableau.com/views/WebsiteMap_4/map_v1",
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
function submit_params(){
  var params = ["Population", "Education", "Lifestyle","College",
    "Grad","Ugrad","Patents","Commute","Crime","Housing"];
  for (param=0;param<params.length;param++){
    var val = document.getElementById(params[param]).value
    viz.getWorkbook().changeParameterValueAsync(params[param], val).then(function (){ console.log('Parameter set');})
  }
}
