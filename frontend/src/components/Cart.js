import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

function Cart() {
  const [cartItems, setCartItems] = useState([]);

  useEffect(() => {
    fetchCart();
  }, []);

  const fetchCart = async () => {
    try {
      const response = await axios.get(`${process.env.REACT_APP_API_URL}/api/cart`);
      setCartItems(response.data);
    } catch (error) {
      console.error('Error fetching cart:', error);
    }
  };

  const updateQuantity = async (productId, quantity) => {
    try {
      await axios.put(`${process.env.REACT_APP_API_URL}/api/cart/update`, {
        productId,
        quantity
      });
      fetchCart();
    } catch (error) {
      console.error('Error updating quantity:', error);
    }
  };

  const removeItem = async (productId) => {
    try {
      await axios.delete(`${process.env.REACT_APP_API_URL}/api/cart/${productId}`);
      fetchCart();
    } catch (error) {
      console.error('Error removing item:', error);
    }
  };

  const total = cartItems.reduce((sum, item) => sum + (item.price * item.quantity), 0);

  return (
    <div className="cart">
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty</p>
      ) : (
        <>
          {cartItems.map(item => (
            <div key={item.productId} className="cart-item">
              <img src={item.imageUrl} alt={item.name} />
              <div>
                <h3>{item.name}</h3>
                <p>${item.price}</p>
                <input
                  type="number"
                  value={item.quantity}
                  onChange={(e) => updateQuantity(item.productId, parseInt(e.target.value))}
                  min="1"
                />
                <button onClick={() => removeItem(item.productId)}>Remove</button>
              </div>
            </div>
          ))}
          <div className="cart-summary">
            <h3>Total: ${total.toFixed(2)}</h3>
            <Link to="/checkout" className="checkout-button">
              Proceed to Checkout
            </Link>
          </div>
        </>
      )}
    </div>
  );
}

export default Cart;