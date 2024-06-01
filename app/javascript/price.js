function price (){
  const amountInput = document.getElementById("item-price");
  amountInput.addEventListener("input", () => {
    const inputValue = amountInput.value;

    const commissionCalc = inputValue * 0.1;
    const commission = Math.floor(commissionCalc);
    const commissionPrice = document.getElementById("add-tax-price");
    commissionPrice.innerHTML = commission;

    const commissionValue = parseInt(commissionPrice.innerHTML, 10);
    const profitCalc = inputValue - commissionValue;
    const profit = Math.floor(profitCalc);
    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = profit;
  })
};

window.addEventListener('turbo:load', price);