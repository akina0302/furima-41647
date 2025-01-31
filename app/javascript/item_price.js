
const price = () => {

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input",()=>{
 const inputValue =Number(priceInput.value);
 const addTaxDom = document.getElementById("add-tax-price");
 const tax = Math.floor(inputValue *0.1);
 const addProfit = document.getElementById("profit");
 addTaxDom.innerHTML = tax;
 addProfit.innerHTML = inputValue-tax;
})
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);