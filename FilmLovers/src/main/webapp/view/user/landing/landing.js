document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll(".time_btn");
    const allTrendings = document.querySelectorAll(".trending-second-box");

    tabs.forEach((tab, index) => {
        tab.addEventListener("click", () => {
            tabs.forEach((t) => t.classList.remove("active"));
            tab.classList.add("active");
            allTrendings.forEach((cont) => {
                cont.classList.remove("active");
            });
            allTrendings[index].classList.add("active");
        });
    });

    const scrollAmount = 200; // Amount to scroll on each click

    // Function to initialize scroll functionality for a container
    function initializeScrollForContainer(containerSelector) {
        const container = document.querySelector(containerSelector);
        const leftButton = document.querySelector(
                `.scroll-btn.left[data-target="${containerSelector.slice(1)}"]`
                );
        const rightButton = document.querySelector(
                `.scroll-btn.right[data-target="${containerSelector.slice(1)}"]`
                );

        if (leftButton) {
            leftButton.addEventListener("click", function () {
                container.scrollBy({left: -scrollAmount, behavior: "smooth"});
            });
        }

        if (rightButton) {
            rightButton.addEventListener("click", function () {
                container.scrollBy({left: scrollAmount, behavior: "smooth"});
            });
        }
    }

    // Initialize scrolling for all containers
    initializeScrollForContainer(".trending-second-box");
    initializeScrollForContainer(".trailer_flex");
    // Add similar calls for other containers if necessary
});
