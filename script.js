function showMessage() {
  document.getElementById("message").classList.remove("hidden");
}

function showLove() {
  document.getElementById("love").classList.remove("hidden");
}
function showMessage() {
  document.getElementById("message").classList.remove("hidden");
}

function showLove() {
  document.getElementById("love").classList.remove("hidden");
  createHearts();
}

function createHearts() {
  const container = document.getElementById("hearts-container");

  for (let i = 0; i < 25; i++) {
    const heart = document.createElement("div");
    heart.className = "heart";
    heart.textContent = "❤️";

    heart.style.left = Math.random() * window.innerWidth + "px";
    heart.style.animationDuration = Math.random() * 2 + 3 + "s";

    container.appendChild(heart);

    setTimeout(() => {
      heart.remove();
    }, 6000);
  }
}