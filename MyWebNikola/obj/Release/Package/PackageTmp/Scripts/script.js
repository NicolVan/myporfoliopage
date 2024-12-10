let text = "Som full stack web developer. ";
const typingText = document.getElementById("typing-text");
let index = 0;

function type() {
    if (index < text.length) {
        typingText.innerHTML += text.charAt(index);
        index++;
        setTimeout(type, 250);
    }
}

document.addEventListener("DOMContentLoaded", type);


