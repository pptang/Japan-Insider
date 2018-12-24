// Service Carousel
(function(document) {
  var prev = document.querySelector('#service div.prev');
  var next = document.querySelector('#service div.next');
  var currentIndex = 0;
  var slideList = document.querySelectorAll('#service ul.slider li');
  prev.addEventListener('click', function() {
    const count = slideList.length;
    slideList[currentIndex].classList.remove('visible');
    currentIndex--;
    if (currentIndex < 0){
      currentIndex = count - 1;
    }
    slideList[currentIndex].classList.add('visible');
  });

  next.addEventListener('click', function() {
    const count = slideList.length;
    slideList[currentIndex].classList.remove('visible');
    currentIndex++;
    if (currentIndex > count - 1){
    currentIndex = 0;
    }
    slideList[currentIndex].classList.add('visible');
  });
})(document);
// Success case carousel
(function(document) {
  var prev = document.querySelector('#success-case div.prev');
  var next = document.querySelector('#success-case div.next');
  var currentIndex = 0;
  var slideList = document.querySelectorAll('#success-case ul.slider li');
  prev.addEventListener('click', function() {
    const count = slideList.length;
    slideList[currentIndex].classList.remove('visible');
    currentIndex--;
    if (currentIndex < 0){
      currentIndex = count - 1;
    }
    slideList[currentIndex].classList.add('visible');
  });

  next.addEventListener('click', function() {
    const count = slideList.length;
    slideList[currentIndex].classList.remove('visible');
    currentIndex++;
    if (currentIndex > count - 1){
    currentIndex = 0;
    }
    slideList[currentIndex].classList.add('visible');
  });
})(document);

