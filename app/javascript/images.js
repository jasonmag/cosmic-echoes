// app/javascript/images.js

document.addEventListener('DOMContentLoaded', function () {
  const heroSection = document.querySelector('.hero-section');

  fetch('https://api.midjourney.com/v1/images/random', {
    headers: {
      'Authorization': 'Bearer YOUR_API_KEY'
    }
  })
  .then(response => response.json())
  .then(data => {
    const imageUrl = data.url;
    heroSection.style.backgroundImage = `url(${imageUrl})`;
  })
  .catch(error => console.error('Error fetching image:', error));
});
