import { useState, useEffect } from 'react';
import { Line } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';
import api from '../services/api';
import StatCard from '../components/StatCard';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

interface Stats {
  totalUsers: number;
  activeUsers: number;
  revenue: number;
  growth: number;
}

interface DashboardProps {
  user: any;
}

export default function Dashboard({ user }: DashboardProps) {
  const [stats, setStats] = useState<Stats | null>(null);
  const [chartData, setChartData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const [statsRes, chartRes] = await Promise.all([
          api.get('/dashboard/stats'),
          api.get('/dashboard/chart-data'),
        ]);

        setStats(statsRes.data);
        setChartData(chartRes.data);
      } catch (error) {
        console.error('Failed to fetch dashboard data:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  if (loading) {
    return <div className="flex items-center justify-center min-h-screen">Loading...</div>;
  }

  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-6xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-2">Welcome, {user.username}!</h1>
        <p className="text-gray-600 mb-8">Here's your dashboard overview</p>

        {/* Stats Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          <StatCard title="Total Users" value={stats?.totalUsers || 0} color="blue" />
          <StatCard title="Active Users" value={stats?.activeUsers || 0} color="green" />
          <StatCard title="Revenue" value={`$${stats?.revenue || 0}`} color="purple" />
          <StatCard title="Growth" value={`${stats?.growth || 0}%`} color="orange" />
        </div>

        {/* Chart */}
        <div className="bg-white rounded-lg shadow-lg p-6">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Analytics</h2>
          {chartData && (
            <Line
              data={chartData}
              options={{
                responsive: true,
                plugins: {
                  legend: {
                    position: 'top' as const,
                  },
                  title: {
                    display: false,
                  },
                },
              }}
            />
          )}
        </div>
      </div>
    </div>
  );
}