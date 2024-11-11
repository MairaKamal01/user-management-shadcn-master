module.exports = {
  apps: [
    {
      name: 'ANC-Client',
      exec_mode: 'cluster',
      instances: 2, // Or a number of instances
      script: '.output/server/index.mjs',
      interpreter: "node",
      args: 'start',
      env: {
        "NODE_ENV": "production",
        "PORT": "5000",
      }
    }
  ]
};
