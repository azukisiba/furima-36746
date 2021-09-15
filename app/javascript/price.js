function price (){
  const priceInput  = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const proPrice = document.getElementById("profit");
    proPrice.innerHTML = Math.floor(inputValue * 0.9);
  });
};

window.addEventListener('load', price);
