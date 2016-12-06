// JavaScript Document
$(document).ready(function () {
    $('btnDownload').on("click", function (event) {
        event.preventDefault()
    });
    //$('#MainContent_btnUpload').on("click", function (event) {
    //    event.preventDefault()
    //});

    $("#MainContent_btnUpload").on("click", function () {
        var canvas = document.getElementById("canvas1");
        canvas.style.backgroundColor = "lightblue";
        var context = canvas.getContext('2d');
        var imageObj1 = new Image();
        imageObj1.src = "/Images/Products/ut-shirt-plain.jpeg";
        imageObj1.onload = function () {
            context.drawImage(imageObj1, 0, 0, 200, 200);
        };
        var imageObj2 = new Image();
        imageObj2.src = localStorage.getItem("myFile");
        imageObj2.onload = function () {
        context.drawImage(imageObj2, 50, 60, 100, 100);
        var img = canvas.toDataURL("image/png");
        $("#canvas1").html('<img src="' + img + '" width="200" height="200"/>')
           
        };
        var button = document.getElementById('btnDownload');
        button.addEventListener('click', function (e) {
            var dataURL = canvas.toDataURL('image/png');
            button.href = dataURL;
        });
    });
});

function addEvents() {
    document.getElementById('file').addEventListener("change", processFile, false);
    //document.getElementById('fileToRetrieve').addEventListener("click", retrieveFile, false);
   // document.getElementById('clear').addEventListener("click", clearStorage, false);
}
function processFile()
{
    var file = document.getElementById('file').files[0];
    writeFileToStorage(file)
}
function writeFileToStorage(file)
{
    var reader = new FileReader();
    reader.onload = function () {
        var img = new Image();
        img.src = reader.result;
        console.log(img.src);
        localStorage.setItem("myFile", img.src);
    }
    reader.onerror = function ()
    {
        alert("There was an error reading the file");
    }
    reader.readAsDataURL(file);
}
function retrieveFile() {
    window.alert("retrieve file")
    var file = localStorage.getItem("myFile");
    if (file !== null) {
        var rImg = new Image();
        rImg.src = file;
        document.getElementById('retrieve').appendChild(rImg);
    }
    else {
        document.getElementById('retrieve').innerText = "";
    }
}
function clearStorage() {
    localStorage.clear();
}

