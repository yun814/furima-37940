function price() {
  const price = document.getElementById('item-price');
  price.addEventListener('keyup', () => {
    const priceVal = price.value;
    const addTaxPrice = document.getElementById('add-tax-price');
    const addTaxPriceVal = Math.floor(priceVal * 0.1);
    const profit = document.getElementById('profit');
    const profitVal = (priceVal - addTaxPriceVal);
    addTaxPrice.innerHTML = addTaxPriceVal.toLocaleString();
    profit.innerHTML = profitVal.toLocaleString();
  });
};

window.addEventListener('load', price);