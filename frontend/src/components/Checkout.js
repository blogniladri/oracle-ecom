import React, { useState } from 'react';
import { useHistory } from 'react-router-dom';
import axios from 'axios';

function Checkout() {
  const history = useHistory();
  const [formData, setFormData] = useState({
    name: '',
    address: '',
    city: '',
    phone: ''
  });

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post(`${process.env.REACT_APP_API_URL}/api/orders/create`, {
        ...formData,
        paymentMethod: 'CASH_ON_DELIVERY'
      });
      // Redirect to order confirmation
      history.push('/order-confirmation');
    } catch (error) {
      console.error('Error placing order:', error);
    }
  };

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  return (
    <div className="checkout">
      <h2>Checkout</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label>Full Name</label>
          <input
            type="text"
            name="name"
            value={formData.name}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label>Address</label>
          <textarea
            name="address"
            value={formData.address}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label>City</label>
          <input
            type="text"
            name="city"
            value={formData.city}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label>Phone</label>
          <input
            type="tel"
            name="phone"
            value={formData.phone}
            onChange={handleChange}
            required
          />
        </div>
        <div className="payment-info">
          <h3>Payment Method</h3>
          <p>Cash on Delivery</p>
        </div>
        <button type="submit">Place Order</button>
      </form>
    </div>
  );
}

export default Checkout;