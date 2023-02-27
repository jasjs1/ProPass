const emojis = [
    "😀", "😁", "😂", "🤣", "😃", "😄", "😅", "😆", "😉", "😊",
    "😋", "😎", "😍", "😘", "🥰", "😗", "😙", "😚", "☺️", "🙂",
    "🤗", "🤔", "🤨", "😐", "😑", "😶", "😏", "😒", "🙄", "😬",
    "🤥", "😌", "😔", "😪", "🤤", "😴", "😷", "🤒", "🤕", "🤢",
    "🤮", "🤧", "🥵", "🥶", "🥴", "😵", "🤯", "🤠", "🥳", "😎",
    "🤩", "😇", "🥺", "🤫", "🤭", "🧐", "🤓", "😈", "👿", "👹",
    "👺", "💀", "👻", "👽", "🤖", "💩", "😺", "😸", "😹", "😻",
    "😼", "😽", "🙀", "😿", "😾"
  ];
  
  function generatePassword() {
    let password = "";
    for (let i = 0; i < 18; i++) {
      const randomIndex = Math.floor(Math.random() * emojis.length);
      password += emojis[randomIndex];
    }
    document.getElementById("password").textContent = password;
  }
  
  document.getElementById("generate-btn").addEventListener("click", generatePassword);
  
