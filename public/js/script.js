window.addEventListener("resize", function () {
    "use strict";
    window.location.reload();
});
alert("I am an alert box!");
document.addEventListener("DOMContentLoaded", function () {
    alert("I am an alert box!");
    if (window.innerWidth < 992) {
        alert("I am an alert box!");
        document.querySelectorAll('.sidebar .nav-link').forEach(function (element) {

            element.addEventListener('click', function (e) {

                let nextEl = element.nextElementSibling;
                let parentEl = element.parentElement;
                let allSubmenus_array = parentEl.querySelectorAll('.submenu');

                if (nextEl && nextEl.classList.contains('submenu')) {
                    e.preventDefault();
                    if (nextEl.style.display == 'block') {
                        nextEl.style.display = 'none';

                    } else {
                        nextEl.style.display = 'block';
                    }

                }
            });
        })
    }
    // end if innerWidth

});