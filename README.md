# E-Commerce Application

A full-stack e-commerce application built with React.js frontend and Spring Boot backend.

## Features

- Product listing and details
- Shopping cart functionality
- Checkout process
- Cash on delivery payment method
- Order management
- Responsive design

## Technology Stack

### Frontend
- React.js
- React Router
- Axios for API calls
- CSS for styling

### Backend
- Spring Boot
- Spring Data JPA
- Oracle Database
- Embedded SQL queries

### Infrastructure
- AWS S3 for static frontend hosting
- AWS EKS for container orchestration
- AWS API Gateway for API management
- Docker for containerization

## Setup Instructions

### Frontend
1. Install dependencies: `cd frontend && npm install`
2. Set environment variables in `.env`
3. Start development server: `npm start`
4. Build for production: `npm run build`

### Backend
1. Build with Maven: `cd backend && mvn clean package`
2. Run the application: `java -jar target/ecommerce-backend-1.0.0.jar`
3. Build Docker image: `docker build -t ecommerce-backend .`

### Database
1. Ensure Oracle Database is running
2. Update database configuration in `application.properties`
3. Tables will be created automatically on application startup

## Deployment

1. Push frontend build to S3 bucket
2. Deploy backend container to EKS cluster
3. Configure API Gateway to route requests to EKS service

## API Endpoints

### Products
- GET /api/products - List all products
- GET /api/products/{id} - Get product details

### Cart
- GET /api/cart - Get cart items
- POST /api/cart/add - Add item to cart
- PUT /api/cart/update - Update cart item
- DELETE /api/cart/{productId} - Remove item from cart

### Orders
- POST /api/orders/create - Create new order