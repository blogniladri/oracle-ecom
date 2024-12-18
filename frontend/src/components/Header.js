import React from 'react';
import { Link } from 'react-router-dom';

function Header() {
  return (
    <header className="header">
      <nav>
        <Link to="/" className="logo">E-Commerce Store</Link>
        <div className="nav-links">
          <Link to="/" className="nav-link">Products</Link>
          <Link to="/cart" className="nav-link">Cart</Link>
        </div>
      </nav>
    </header>
  );
}

export default Header;