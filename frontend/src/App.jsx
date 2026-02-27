import { Routes, Route } from 'react-router-dom'
import './CSS/App.css'
import Home from './Pages/homeShell.jsx'
import AppLayout from './Layouts/AppLayout.jsx'
import Login from './Pages/login.jsx'

function App() {
  return (
    <main className='maincontent'>
      <Routes>
        <Route element={<AppLayout />}>
          <Route path="/" element={<Login />}/>
          <Route path="/home" element={<Home />}/>
        </Route>
      </Routes>
    </main>
  )
}

export default App
