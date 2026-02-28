version: '3.8'

services:
  mongodb:
    image: mongo:6
    container_name: portfolio-dashboard-mongodb
    ports:
      - "27017:27017"
    environment:
      MONGO_INITDB_DATABASE: portfolio_dashboard
    volumes:
      - mongodb_data:/data/db
    networks:
      - portfolio-network

  backend:
    build: ./backend
    container_name: portfolio-dashboard-backend
    ports:
      - "5000:5000"
    environment:
      NODE_ENV: development
      MONGO_URI: mongodb://mongodb:27017/portfolio_dashboard
      JWT_SECRET: your-super-secret-jwt-key-change-in-production
      CORS_ORIGIN: http://localhost:3000
    depends_on:
      - mongodb
    volumes:
      - ./backend/src:/app/src
    networks:
      - portfolio-network

  frontend:
    build: ./frontend
    container_name: portfolio-dashboard-frontend
    ports:
      - "3000:5173"
    environment:
      VITE_API_URL: http://localhost:5000/api
    depends_on:
      - backend
    volumes:
      - ./frontend/src:/app/src
    networks:
      - portfolio-network

volumes:
  mongodb_data:

networks:
  portfolio-network:
    driver: bridge