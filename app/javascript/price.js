window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     console.log(inputValue);

     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
       console.log(addTaxDom);

     const profitNum = document.getElementById("profit");
       const salesProfit = inputValue * 0.1
       profitNum.innerHTML = (Math.floor(inputValue - salesProfit));
         console.log(profitNum);
  })
});