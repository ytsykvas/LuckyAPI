import React from 'react';
import { rates } from '../../public/rate_data';

const CurrencyTable = () => {
  return (
    <div className="table-container">
      <table className="currency-table">
        <thead>
          <tr>
            <th>Currency</th>
            <th>Exchange Rate</th>
          </tr>
        </thead>
        <tbody>
          {Object.keys(rates).map(currency => (
            <tr key={currency}>
              <td>{currency}</td>
              <td>{rates[currency].toFixed(2)}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default CurrencyTable;
