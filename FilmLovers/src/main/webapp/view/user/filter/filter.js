//const fromDate = document.getElementById("from");
//const toDate = document.getElementById("to");

//fromDate.addEventListener("change", function () {
//  toDate.setAttribute("min", this.value);
//  console.log("From date selected:", this.value);
//});
//
//toDate.addEventListener("change", function () {
//  fromDate.setAttribute("max", this.value);
//  console.log("To date selected:", this.value);
//});

var slider = document.getElementById("slider");

noUiSlider.create(slider, {
    start: [runtimeFromValue, runtimeToValue],
    connect: true,
    range: {
        min: 10,
        "33%": 120,
        "66%": 240,
        max: 360
    },
    pips: {
        mode: "values",
        values: [10, 120, 240, 360],
        density: 4
    },
    format: {
        to: function (value) {
            return value === 360 ? "360+" : Math.round(value);
        },
        from: function (value) {
            return value.replace("+", "");
        }
    }
});

slider.noUiSlider.on("update", function (values) {
    
    // set value to display
    var runtimeFrom = document.getElementById("value-lower");
    var runtimeTo = document.getElementById("value-upper");
    runtimeFrom.innerHTML = values[0];
    runtimeTo.innerHTML = values[1];
    
    // set value to form
    var runtimeFromInput = document.getElementById("runtimeFrom");
    var runtimeToInput = document.getElementById("runtimeTo");
    runtimeFromInput.value = parseFloat(values[0]);
    var runtimeToValue = values[1] === "360+" ? 360 : parseFloat(values[1]);
    runtimeToInput.value = runtimeToValue;
    
});

function loadMore() {
    var filmRows = document.querySelectorAll(".filmRow");

    var lastFilmId = null;
    if (filmRows.length > 0) {
        var lastFilmRow = filmRows[filmRows.length - 1];
        var idAttr = lastFilmRow.getAttribute("id");
        var idParts = idAttr.split("_");
        lastFilmId = idParts[idParts.length - 1];
    }
    document.getElementById("lastFilmId").value = lastFilmId;

    document.getElementById("filterForm").submit();
}
