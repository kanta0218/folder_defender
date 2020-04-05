function index_open() {
    $("#index_contents").toggle("slow");
    var c = document.getElementById("index_contents").style.display;
    if (c=="block") {
        document.getElementById("btn_index_oc").innerHTML = "▲ CLOSE ▲";
        exit;
    } if (c=="none") {
        document.getElementById("btn_index_oc").innerHTML = "▼ OPEN ▼";
        exit;
    }
}