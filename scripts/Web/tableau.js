function initViz() {
    var containerDiv = document.getElementById("vizContainer"),
        url = "http://public.tableau.com/views/JSA_V1_Reranked/V1_reranked_simple",
        options = {
            hideTabs: false,
            onFirstInteractive: function () {
                console.log("Run this code when the viz has finished loading.");
            }
        };

    var viz = new tableau.Viz(containerDiv, url, options);
}
