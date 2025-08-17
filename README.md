# Minecraft Bedrock Server

This project sets up a Minecraft Bedrock server using Docker and deploys it on Railway.app.

## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd minecraft-bedrock-server
   ```

2. **Ensure Docker is installed** on your machine.

3. **Run the server locally**:
   ```bash
   docker-compose up
   ```

4. **Access the server**:
   - Connect to the server using the IP address of your machine and port `19132`.

## Deployment on Railway.app

1. **Create a new project** on Railway.app.
2. **Link your GitHub repository** containing this project.
3. **Railway will automatically detect the `railway.toml`** file and set up the deployment.
4. **Monitor the deployment logs** to ensure everything is running smoothly.

## Notes

- The `data` directory is used for persistent storage of your Minecraft server data.
- Make sure to accept the EULA by setting the `EULA` environment variable to "TRUE" in the `docker-compose.yml` file.

Enjoy your Minecraft Bedrock server!