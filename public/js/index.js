// testimonial

const track = document.querySelector('.carousel-track');
const items = document.querySelectorAll('.carousel-item');
const previousBtn = document.querySelector('.carousel-btn.prev');
const next_Btn = document.querySelector('.carousel-btn.next');

// Current index
let currentIndex = 0;

// Update the carousel position
function updateCarousel() {
  const offset = -currentIndex * 100;
  track.style.transform = `translateX(${offset}%)`;
}

// Previous button click event
previousBtn.addEventListener('click', () => {
  currentIndex = (currentIndex - 1 + items.length) % items.length;
  updateCarousel();
});

// Next button click event
next_Btn.addEventListener('click', () => {
  currentIndex = (currentIndex + 1) % items.length;
  updateCarousel();
});




// //  book carousal

const bookTrack = document.getElementById("book-track");
const prevBtn = document.querySelector(".previous");
const nextBtn = document.querySelector(".next");

let ScrollAmount = 0;

// Previous button click event
prevBtn.addEventListener("click", () => {
  const cardwidth = document.querySelector(".book-card1").offsetWidth + 20;
  ScrollAmount = Math.max(ScrollAmount - cardwidth, 0);
  bookTrack.style.transform = `translateX(-${ScrollAmount}px)`;
})

// Next button click event
nextBtn.addEventListener("click", () => {
  const cardwidth = document.querySelector(".book-card1").offsetWidth + 20;
  const trackWidth = bookTrack.scrollWidth
  const visibleWidth = document.querySelector(".book-section").offsetWidth;
  const buffer = 150;
  // Calculate the maximum scrollable width
  const maxScroll = trackWidth - visibleWidth + buffer;
  // Adjust ScrollAmount to not exceed maxScroll
  ScrollAmount = Math.min(ScrollAmount + cardwidth, maxScroll);
  bookTrack.style.transform = `translateX(-${ScrollAmount}px)`;

})


// logged in message for home page
setTimeout(() => {
  const alert = document.querySelector(".alert");
  if (alert) {
    alert.style.display = "none";
  }

}, 3000);




