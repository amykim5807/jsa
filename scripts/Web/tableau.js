
//Loading tableau visualization on initial page load
function initViz() {
    var containerDiv = document.getElementById("vizContainer"),
        //url = "http://public.tableau.com/views/WebsiteMap_4/map_v1",
        url = "http://public.tableau.com/views/JSA_All_MSAs_0/Dashboard1",
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
