import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

function ProductDetail() {
  const [product, setProduct] = useState(null);
  const { id } = useParams();

  useEffect(() => {
    fetchProductDetails();
  }, [id]);

  const fetchProductDetails = async () => {
    try {
      const response = await axios.get(`${process.env.REACT_APP_API_URL}/api/products/${id}`);
      setProduct(response.data);
    } catch (error) {
      console.error('Error fetching product details:', error);
    }
  };

  const addToCart = async () => {
    try {
      await axios.post(`${process.env.REACT_APP_API_URL}/api/cart/add`, {
        productId: product.id,
        quantity: 1
      });
      // Show success message or redirect to cart
    } catch (error) {
      console.error('Error adding to cart:', error);
    }
  };

  if (!product) return <div>Loading...</div>;

  return (
    <div className="product-detail">
      <img src={product.imageUrl} alt={product.name} />
      <h2>{product.name}</h2>
      <p>{product.description}</p>
      <p>Price: ${product.price}</p>
      <p>Stock: {product.stockQuantity}</p>
      <button onClick={addToCart}>Add to Cart</button>
    </div>
  );
}

export default ProductDetail;