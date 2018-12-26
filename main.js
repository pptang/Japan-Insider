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

// Toggle Menu
function toggleMenu() {
  var navbar = document.getElementById("navbar");
  if (navbar.className === '') {
    navbar.className += ' responsive';
  } else {
    navbar.className = '';
  }
}

// Top page carousel
;(function(window, document) {
  var topSection = document.getElementById('top');
  var i = 1;
  setInterval(function() {
    if (i > 3) {
      i = 1;
    }
    topSection.style.backgroundImage = `url('./img/top-${i}.jpg')`;
    i++;
  }, 3000);
})(window, document);

// Smooth scroll
;(function(window, document) {
  // Add scrolling animation
  document.querySelectorAll('a[href^="#"]').forEach(function(anchor) {
    anchor.addEventListener('click', function(e) {
      e.preventDefault()
      removeCurrentSelectedClass()
      if (this.id === 'logo-link') {
        document.getElementById('top-link').classList.add('selected');
      } else {
        this.classList.add('selected')
      }
    })
  })

  var scroll = new SmoothScroll('a[href*="#"]', {offset: 150})

  function removeCurrentSelectedClass() {
    document.querySelectorAll('a[href^="#"]').forEach(function(anchor) {
      anchor.classList.remove('selected')
    })
  }

  // document.addEventListener('scroll', function() {
  //   var $document = document.documentElement
  //   var $header = document.querySelector('header')
  //   if ($document.scrollTop > 105) {
  //     $header.classList.add('white-background')
  //   } else {
  //     $header.classList.remove('white-background')
  //   }
  // })
})(window, document)

