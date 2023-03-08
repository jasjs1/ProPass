const form = document.getElementById('password-form');
const passwordList = document.getElementById('password-list');
const file = document.querySelector('.file');

form.addEventListener('submit', function(event) {
	event.preventDefault();
	const passwordInput = document.getElementById('password-input');
	const usageInput = document.getElementById('usage-input');
	const password = passwordInput.value;
	const usage = usageInput.value;
	savePassword(password, usage);
	passwordInput.value = '';
	usageInput.value = '';
});

function savePassword(password, usage) {
	let passwords = localStorage.getItem('passwords');
	if (!passwords) {
		passwords = [];
	} else {
		passwords = JSON.parse(passwords);
	}
	passwords.push({password, usage});
	localStorage.setItem('passwords', JSON.stringify(passwords));
	showPasswords();
