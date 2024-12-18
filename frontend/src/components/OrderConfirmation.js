import React from 'react';
import { Link } from 'react-router-dom';

function OrderConfirmation() {
  return (
    <div className="order-confirmation">
      <h2>Order Confirmed!</h2>
      <p>Thank you for your order. Your order has been successfully placed.</p>
      <p>Payment Method: Cash on Delivery</p>
      <div className="actions">
        <Link to="/" className="continue-shopping">
          Continue Shopping
        </Link>
      </div>
    </div>
  );
}

export default OrderConfirmation;