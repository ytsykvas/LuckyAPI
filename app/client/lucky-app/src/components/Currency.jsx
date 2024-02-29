import React, { useState } from 'react';
import { rates } from '../../public/rate_data';
import CurrencyTable from './CurrencyTable';

const Currency = () => {
  const [amount, setAmount] = useState('');
  const [selectedCurrency, setSelectedCurrency] = useState('USD');
  const [result, setResult] = useState(null);

  const handleCurrencyChange = (event) => {
    setSelectedCurrency(event.target.value);
  };

  const handleAmountChange = (event) => {
    setAmount(event.target.value);
  };

  const handleSubmit = () => {
    if (amount.trim() === '') {
      setResult('0.00');
    } else {
      const exchangeRate = rates[selectedCurrency];
      const convertedAmount = parseFloat(amount) * exchangeRate;
      setResult(convertedAmount.toFixed(2));
    }
  };

  return (
    <div className="content-container">
    <CurrencyTable />
    <h3>How much UAH will you get?</h3>
      <nav>
        <div className="input-select-wrapper">
          <select value={selectedCurrency} onChange={handleCurrencyChange} data-test-id="currency-select">
            {Object.keys(rates).map(currency => (
              <option key={currency} value={currency}>{currency}</option>
            ))}
          </select>
          <input type="number" value={amount} onChange={handleAmountChange} data-test-id="currency-amount"/>
        </div>
        <button className="button-main" onClick={handleSubmit} data-test-id="submit-exchange">Count</button>
        {result && <div className="result-element">You will get: {result}</div>}
      </nav>
    </div>
  );
};

export default Currency;
