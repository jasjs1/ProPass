function checkPassword() {
    let password = document.getElementById('password').value;
    let strengthMeter = document.getElementById('strength');
    let percent = document.getElementById('percent');
  
    // Default state
    strengthMeter.style.backgroundColor = 'red';
    strengthMeter.style.width = '0%';
    percent.textContent = '';
  
    // Check strength
    if (password.length >= 1 && password.length < 8) {
      strengthMeter.style.backgroundColor = 'red';
      strengthMeter.style.width = '25%';
      percent.textContent = '25% - Weak';
    } else if (password.length >= 8 && /[a-z]/.test(password) && /[A-Z]/.test(password) && /\d/.test(password)) {
      strengthMeter.style.backgroundColor = 'green';
      strengthMeter.style.width = '100%';
      percent.textContent = '100% - Very Strong';
    } else if (password.length >= 8 && (/[a-z]/.test(password) || /[A-Z]/.test(password)) && /\d/.test(password)) {
      strengthMeter.style.backgroundColor = 'orange';
      strengthMeter.style.width = '75%';
      percent.textContent = '75% - Strong';
    } else if (password.length >= 8 && (/[a-z]/.test(password) || /[A-Z]/.test(password))) {
      strengthMeter.style.backgroundColor = 'yellow';
      strengthMeter.style.width = '50%';
      percent.textContent = '50% - Moderate';
    } else {
      strengthMeter.style.backgroundColor = 'red';
      strengthMeter.style.width = '25%';
      percent.textContent = '25% - Weak';
    }
  }
  
