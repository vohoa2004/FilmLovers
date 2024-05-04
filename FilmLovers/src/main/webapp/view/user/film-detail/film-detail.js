const scrollAmount = 200;

function scrollContainer(button, scrollLeft) {
  const targetId = button.getAttribute("data-target");
  const scrollTarget = document.getElementById(targetId);

  if (scrollTarget) {
    scrollTarget.scrollBy({
      left: scrollLeft ? -scrollAmount : scrollAmount,
      behavior: "smooth",
    });
  }
}

document.querySelectorAll(".scroll-btn").forEach((button) => {
  button.addEventListener("click", function () {
    const isLeftButton = this.classList.contains("left");
    scrollContainer(this, isLeftButton);
  });
});
