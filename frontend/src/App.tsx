import { useEffect, useState } from 'react'

function App() {
  const [status, setStatus] = useState('Loading...')

  useEffect(() => {
    fetch('http://localhost:8080/api/health')
      .then((response) => response.json())
      .then((data) => {
        setStatus(data.status)
      })
      .catch(() => {
        setStatus('API unavailable')
      })
  }, [])

  return (
    <main>
      <h1>Auto Service</h1>
      <p>API status: {status}</p>
    </main>
  )
}

export default App