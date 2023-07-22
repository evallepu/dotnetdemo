# Use an ARM64 base image
FROM arm64v8/debian:buster-slim

# Install dependencies and copy the dotnet application files
COPY ./app /app

# Set the working directory and expose the required port
WORKDIR /app
EXPOSE 9000

# Set any environment variables required for the dotnet application

# Start the dotnet application
CMD ["dotnet", "YourAppName.dll"]
