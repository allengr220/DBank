import { DBank } from "../../declarations/DBank";

window.addEventListener("load", async function() {
  //console.log("Finished loading");
  update();
});

document.querySelector("form").addEventListener("submit", async function(event) {
  //console.log("Finished loading");
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  if (document.getElementById("input-amount").value.length != 0) {
   await DBank.topUp(inputAmount);
  }
   

 if (document.getElementById("withdrawal-amount").value.length != 0) {
    await DBank.withdraw(outputAmount);
  }

  await DBank.compound();

  update();

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";

  button.removeAttribute("disabled");
});

async function update() {
  const currentAmount = await DBank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100)/100;

};
