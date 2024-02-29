import React from 'react';
import { cities } from '../data';

export default function Cities({ selectedCities, handleCityChange }) {
  return (
    <div className="city-checkboxes">
      {cities.map(city => (
        <label key={city}>
          <input
            type="checkbox"
            value={city}
            checked={selectedCities.includes(city)}
            onChange={() => handleCityChange(city)}
          />
          {city}
        </label>
      ))}
    </div>
  );
}
