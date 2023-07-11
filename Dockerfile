# Use the base image
FROM mcr.microsoft.com/dotnet/sdk:3.1


# Create a new user 'appuser'
RUN useradd -ms /bin/bash appuser

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . .

# Change ownership to 'appuser'
RUN chown -R appuser:appuser /app

# Switch to the 'appuser' before running the application
USER appuser

# Start the application
CMD ["dotnet", "run"]
