A full-stack interactive dashboard application showcasing modern web development practices and architectural patterns.

## ✨ Features

- **Real-time Data Visualization** - Interactive charts and analytics
- **Responsive Design** - Works seamlessly on desktop, tablet, and mobile
- **RESTful API** - Well-documented backend API
- **Authentication** - Secure user session management
- **Modern Stack** - React 18, TypeScript, Express.js, MongoDB
- **Docker Support** - Easy deployment with Docker Compose

## 🚀 Tech Stack

### Frontend
- React 18 with TypeScript
- Tailwind CSS for styling
- Chart.js for data visualization
- Axios for API calls
- Vite for fast development

### Backend
- Node.js & Express.js
- MongoDB for data persistence
- JWT for authentication
- Mongoose for schema validation

### DevOps
- Docker & Docker Compose
- Environment-based configuration
- Production-ready setup

## 📦 Prerequisites

- Node.js 18+
- Docker & Docker Compose (optional)
- MongoDB (or use Docker)

## 🛠️ Installation

### Option 1: Local Setup

```bash
# Install frontend dependencies
cd frontend
npm install

# Install backend dependencies
cd ../backend
npm install

# Start MongoDB locally
# Update MONGO_URI in backend/.env if needed

# Terminal 1: Start backend
cd backend
npm run dev

# Terminal 2: Start frontend
cd frontend
npm run dev
