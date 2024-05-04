// toggle between dark and light theme
function changeMode(){
    var element = document.body;
    element.classList.toggle("dark-theme");
    var textElements = document.querySelectorAll(".text-dark");
    textElements.forEach(function(textElement) {
        textElement.classList.toggle("text-white");
    });
}


// let search = document.querySelector(".search");
// search.onclick = function(){
//     document.querySelector(".container").classList.toggle('active');
// }

document.getElementById("search").addEventListener('input', function(){
    var clearButton = document.querySelector(".clear");
    if(this.value !==''){
        clearButton.style.display = 'block';
    }else{
        clearButton.style.display = 'none';
    }
});

let clear = document.querySelector('.clear');
clear.onclick = function(){
    document.getElementById("search").value = "";
    var clearButton = document.querySelector(".clear");
    clearButton.style.display = 'none';
}



