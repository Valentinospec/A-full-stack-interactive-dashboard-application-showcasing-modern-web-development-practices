import { useState } from 'react';

interface NavbarProps {
  user: any;
  onLogout: () => void;
}

export default function Navbar({ user, onLogout }: NavbarProps) {
  const [showMenu, setShowMenu] = useState(false);

  return (
    <nav className="bg-gray-900 text-white shadow-lg">
      <div className="max-w-6xl mx-auto px-8 py-4 flex justify-between items-center">
        <h1 className="text-2xl font-bold">📊 Portfolio Dashboard</h1>
        
        <div className="flex items-center gap-4">
          <span className="text-gray-300">{user.username}</span>
          <button
            onClick={onLogout}
            className="bg-red-600 hover:bg-red-700 px-4 py-2 rounded-lg transition"
          >
            Logout
          </button>
        </div>
      </div>
    </nav>
  );
}