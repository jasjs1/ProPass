// Define the different theme options
const LIGHT_THEME = 'light';
const DARK_THEME = 'dark';

// Function that applies the selected theme to the website
function applyTheme(theme) {
  // Select the <body> element
  const body = document.querySelector('body');

  // Apply the appropriate class to the <body> element based on the selected theme
  if (theme === LIGHT_THEME) {
    body.classList.remove(DARK_THEME);
    body.classList.add(LIGHT_THEME);
  } else {
    body.classList.remove(LIGHT_THEME);
    body.classList.add(DARK_THEME);
  }
}

// Use localStorage to store the user's theme preference
const localStorageKey = 'user-theme';
const savedTheme = localStorage.getItem(localStorageKey);
if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
    // Set the website theme to dark
    document.body.style.backgroundColor = '#1a1a1a';
    document.body.style.color = '#f0f0f0';
  } else {
    // Set the website theme to light
    document.body.style.backgroundColor = '#f0f0f0';
    document.body.style.color = '#1a1a1a';
  }
// When the website loads, apply the saved theme if there is one, or use a default theme
if (savedTheme) {
  applyTheme(savedTheme);
} else {
  applyTheme(LIGHT_THEME);
}

// Add event listeners to UI controls that allow the user to change their theme preference
const themeButtons = document.querySelectorAll('.theme-button');
themeButtons.forEach(button => {
  button.addEventListener('click', () => {
    const selectedTheme = button.getAttribute('data-theme');
    localStorage.setItem(localStorageKey, selectedTheme);
    applyTheme(selectedTheme);
  });
});
