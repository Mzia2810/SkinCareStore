module.exports = {
  apps: [
    {
      name: "skin-backend",
      script: "index.js",
      cwd: "/home/azureuser/SkinCareStore/backend/backend", // working directory
      env: {
        NODE_ENV: "production",
        PORT: 8000,
        MONGO_URI: "mongodb+srv://mziaofficial0_db_user:NkTqAhPYaIomh2MC@cluster0.apv1lmz.mongodb.net/skinstore?retryWrites=true&w=majority",
        JWT_SECRET: "MuhammadZia"
      }
    }
  ]
};