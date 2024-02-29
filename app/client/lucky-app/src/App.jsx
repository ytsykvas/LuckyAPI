import Currency from './components/Currency';
import Header from './components/Header'
import Timezone from './components/Timezone';


export default function App() {
  return (
    <div>
      <Header/>
      <main>
        <h1>What can you do?</h1>
        <h3>1) to play with timezones:</h3>
        <Timezone />
        <h3>2) to convert currency to UAH:</h3>
        <Currency />
      </main>
    </div>
  )
}
