let colors = ["#1C2E4A", "#52677D", "#BDC4D4", "#0F1A2B"]
const typingText = document.getElementById("typing-text");
let colorIndex = 0;

function changeColor() {
    typingText.style.color = colors[colorIndex];
    colorIndex = (colorIndex + 1) % colors.length; 
    setTimeout(changeColor, 500); 
}

document.addEventListener("DOMContentLoaded", changeColor);
