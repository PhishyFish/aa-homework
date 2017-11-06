document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "rgb(93, 94, 96)";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 175, 0, Math.PI * 2, true);
  ctx.strokeStyle = "rgb(140, 140, 145)";
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = "rgb(150, 215, 225)";
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(125, 75);
  ctx.quadraticCurveTo(125, 125, 160, 125);
  ctx.quadraticCurveTo(125, 125, 125, 200);
  ctx.quadraticCurveTo(125, 125, 90, 125);
  ctx.quadraticCurveTo(125, 125, 125, 75);
  ctx.fillStyle = "rgb(240, 240, 240)";
  ctx.fill();
});
