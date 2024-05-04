const fromDate = document.getElementById("from");
const toDate = document.getElementById("to");

fromDate.addEventListener("change", function () {
  toDate.setAttribute("min", this.value);
  console.log("From date selected:", this.value);
});

toDate.addEventListener("change", function () {
  fromDate.setAttribute("max", this.value);
  console.log("To date selected:", this.value);
});

var slider = document.getElementById("slider");

noUiSlider.create(slider, {
  start: [10, 360],
  connect: true,
  range: {
    min: 10,
    "33%": 120,
    "66%": 240,
    max: 360,
  },
  pips: {
    mode: "values",
    values: [10, 120, 240, 360],
    density: 4,
  },
  format: {
    to: function (value) {
      return value === 360 ? "360+" : Math.round(value);
    },
    from: function (value) {
      return value.replace("+", "");
    },
  },
});

slider.noUiSlider.on("update", function (values, handle) {
  var valueLower = document.getElementById("value-lower");
  var valueUpper = document.getElementById("value-upper");
  valueLower.innerHTML = values[0];
  valueUpper.innerHTML = values[1];
});
