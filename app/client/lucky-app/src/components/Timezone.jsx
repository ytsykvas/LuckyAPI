import React, { useState } from 'react';
import Cities from './Cities';

export default function Timezone() {
  const [timeInfo, setTimeInfo] = useState(null);
  const [selectedCities, setSelectedCities] = useState([]);

  const getTimeInfo = async () => {
    try {
      const url = new URL('http://localhost:3000/api/times');
      url.searchParams.set('cities', selectedCities.join(','));
      
      const response = await fetch(url.toString());
      const data = await response.json();
      setTimeInfo(data);
    } catch (error) {
      console.error('Error fetching time info:', error);
    }
  };

  const handleCityChange = (city) => {
    setSelectedCities(prevCities => {
      if (prevCities.includes(city)) {
        return prevCities.filter(selectedCity => selectedCity !== city);
      } else {
        return [...prevCities, city];
      }
    });
  };

  return (
    <div className="content-container">
      <nav>
        <Cities selectedCities={selectedCities} handleCityChange={handleCityChange} />
        <button className="button-main" onClick={getTimeInfo} data-test-id="submit-cities">Get Time Info</button>
        {timeInfo && (
          <div className="rendered-content">
            <h4>Time Information:</h4>
            <ul>
              {Object.entries(timeInfo).map(([location, time]) => (
                <li key={location}>
                  {location}: {time}
                </li>
              ))}
            </ul>
          </div>
        )}
      </nav>
    </div>
  );
}
