// Carousel
var prev = document.querySelector('div.prev');
var next = document.querySelector('div.next');
var index = 0;
var lis = document.querySelectorAll('ul.slider li');
var count = lis.length;

prev.addEventListener('click', function() {
    lis[index].classList.remove('visible');
    index--;
    if (index < 0){
        index = count-1;
    }

    lis[index].classList.add('visible');
});

next.addEventListener('click', function() {
    lis[index].classList.remove('visible');
    index++;
    if (index > count-1){
        index = 0;
    }

    lis[index].classList.add('visible');
});
