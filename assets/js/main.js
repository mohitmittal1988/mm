```javascript
// assets/js/main.js
document.addEventListener('DOMContentLoaded', () => {
  const filterButtons = document.querySelectorAll('.filter-btn');
  const publications = document.querySelectorAll('.publication');

  filterButtons.forEach(button => {
    button.addEventListener('click', () => {
      const filter = button.dataset.filter;
      publications.forEach(pub => {
        if (filter === 'all' || pub.classList.contains(filter)) {
          pub.style.display = 'block';
        } else {
          pub.style.display = 'none';
        }
      });
    });
  });
});
```