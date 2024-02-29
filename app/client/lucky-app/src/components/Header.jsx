import React from 'react';
import logo from '../assets/logo.jpg'

export default function Header() {
  return (
    <header>
      <img src={logo} alt="Logo" className="logo" />
      <span>Candidate: Yurii Tsykvas</span>
    </header>
  )
}
