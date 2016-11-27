// JavaScript Document
$(document).ready(function () {
    $("#btnUpload").on("click", function (event) {
        event.preventDefault()
    });
    window.alert("window loaded");
    $("#MainContent_btnUpload").on("click", function () {
        window.alert("btn upload");
                var canvas = document.getElementById("canvas1");
                canvas.style.backgroundColor = "lightblue";
                var context = canvas.getContext('2d');
                var imageObj1 = new Image();
                imageObj1.src = "/Images/Products/ut-shirt-plain.jpeg";
                imageObj1.onload = function () {
                    context.drawImage(imageObj1, 0, 0, 200, 200);
                };
                var imageObj2 = new Image();
                imageObj2.src = "/Images/Products/t1.jpg";
                imageObj2.onload = function () {
               context.drawImage(imageObj2, 50, 60, 100, 100);
               var img = canvas.toDataURL("image/png");
               $("#canvas1").html('<img src="' + img + '" width="200" height="200"/>')
                //document.write();
                };
            });
});



//function EventListeners() {
//    
//    document.getElementById("#btnUpload").addEventListener("click", btnUpload(), false)
//}
//function btnUpload() {
//    window.alert("sometext");
//    var canvas = document.getElementById("canvas1");
//    canvas.style.backgroundColor = "lightblue";
//    var context = canvas.getContext('2d');
//    var imageObj1 = new Image();
//    imageObj1.src = "~/Images/Products/ut-shirt-plain.jpeg"
//    imageObj1.onload = function () {
//        context.drawImage(imageObj1, 0, 0, 328, 526);
//    };
//    var imageObj2 = new Image();
//    imageObj2.src = "~/Images/Products/t1.jpg"
//    imageObj2.onload = function () {
//        context.drawImage(imageObj2, 15, 85, 300, 300);
//        var img = canvas.toDataURL("image/png");
//        document.write('<img src="' + img + '" width="328" height="526"/>');
//    };
//}
