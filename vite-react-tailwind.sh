#!/bin/bash

# Step 1: Create a new Vite project with React template
npm create vite@latest . -- --template react

# Step 2: Install project dependencies
npm install

# Step 3: Install Tailwind CSS and its dependencies
npm install -D tailwindcss postcss autoprefixer

# Step 4: Initialize Tailwind CSS configuration
npx tailwindcss init -p

# Step 5: Set up Tailwind in index.css
echo '@tailwind base;' > ./src/index.css
echo '@tailwind components;' >> ./src/index.css
echo '@tailwind utilities;' >> ./src/index.css

# Step 6: Configure Tailwind content paths
cat <<EOL > tailwind.config.js
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOL

echo "Vite + React + Tailwind CSS setup complete!"
