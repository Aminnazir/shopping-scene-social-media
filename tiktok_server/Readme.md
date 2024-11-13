\# TikTok Playwright Scraping Service

A Node.js project for scraping TikTok using Playwright. This setup uses
Docker to streamline the installation and environment setup.

\## Table of Contents

\- \[Dependencies\](#dependencies)

\- \[Installation\](#installation)

\- \[Environment Variables\](#environment-variables)

\- \[Usage\](#usage)

\- \[Common Issues\](#common-issues)

\- \[Additional Commands\](#additional-commands)

\- \[Resources\](#resources)

\## Dependencies

The following are the primary dependencies required for this project:

\### Node.js Dependencies

1\. \*\*Node.js\*\* (v16)

2\. \*\*Playwright\*\* - For browser automation.

3\. \*\*Express\*\* - To create a web server (if used in your project).

4\. \*\*dotenv\*\* - To manage environment variables.

These dependencies are defined in your \`package.json\`:

\`\`\`json

{

\"dependencies\": {

\"express\": \"\^4.18.2\",

\"playwright\": \"\^1.41.1\",

\"dotenv\": \"\^16.0.3\"

}

}

### System Packages

1.  libasound2 - Audio library for Playwright.

2.  libdbus-glib-1-2 - For D-Bus bindings.

3.  libgtk-3-dev - GTK+ 3 library for GUI support.

4.  libevent-dev - Event notification library for network applications.

These are installed in the Dockerfile using:

Dockerfile

Copy code

RUN apt-get update && \\

apt-get install -y \\

libasound2 \\

libdbus-glib-1-2 \\

libgtk-3-dev \\

libevent-dev && \\

apt-get clean && \\

rm -rf /var/lib/apt/lists/\*

### Docker Dependencies

-   **Docker**: Containerization platform.

-   **Docker Compose**: For multi-container Docker applications.

## Installation

### Step 1: Clone the Repository

bash

Copy code

git clone \<repository-url\>

cd project-root

### Step 2: Set Up Environment Variables

Create a .env file in the project root and define the required
variables:

env

Copy code

TIKTOK_CONTAINER=tiktok_service

TIKTOK_PORT=3000

### Step 3: Install Node.js Dependencies

If you are setting up without Docker:

bash

Copy code

cd node_project

npm install

### Step 4: Build Docker Image

If you are using Docker, build and start the services with:

bash

Copy code

docker-compose up \--build

## Environment Variables

The project uses environment variables to configure the application.
Here are the common ones:

-   **PLAYWRIGHT_BROWSERS_PATH**: Set to use a specific path for
    > Playwright browsers.

    bash

    Copy code

    PLAYWRIGHT_BROWSERS_PATH=/var/www/html/.playwright-browsers

## Usage

Once the application is running, you can access the service at:

bash

Copy code

http://localhost:3000

To run the scraper manually, you can use:

bash

Copy code

npm run scrape

## Common Issues

### 1. Permission Denied Errors

If you encounter errors related to permissions, particularly when
Playwright is installing:

-   Ensure the /root/.cache/ms-playwright directory has the correct
    > permissions:

    bash

    Copy code

    chmod -R 777 /root/.cache/ms-playwright

### 2. Browser Not Found Error

If you see Executable doesn\'t exist at /root/.cache/ms-playwright/\...:

-   Run Playwright browser installation manually:

    bash

    Copy code

    npx playwright install

### 3. XServer Not Running Error

If you encounter the error Looks like you launched a headed browser
without having an XServer running:

-   Use the xvfb-run command to run the application in a virtual X
    > server:

    bash

    Copy code

    xvfb-run npm start

## Additional Commands

-   **Rebuild the Docker Image**:

    bash

    Copy code

    docker-compose up \--build

-   **Stop and Remove Containers**:

    bash

    Copy code

    docker-compose down

-   **View Logs**:

    bash

    Copy code

    docker-compose logs -f

## Resources

-   Node.js Official Documentation

-   Playwright Documentation

-   Docker Documentation

This guide should help you get started with setting up the project and
provide solutions for common setup issues.

markdown

Copy code

\### Notes:

\- The JSON block is enclosed correctly using triple backticks with
\`json\`, which prevents breaking the Markdown formatting.

\- Detailed setup steps, including common errors and fixes, are outlined
for better guidance.

\- Additional commands are included for Docker management, and resources
are provided for reference.