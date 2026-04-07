Automated DokuWiki Deployment on AWS
🚀 Project Overview
This project provides a robust Bash automation script to deploy a DokuWiki instance on an Ubuntu-based Linux server using Apache and PHP.

Developed as part of my Cloud Engineering transition, this script replaces manual, error-prone configurations with a consistent, repeatable deployment process—ideal for spinning up internal knowledge hubs on AWS EC2.

🛠 Tech Stack
Language: Bash Scripting (Shell)

Web Server: Apache (HTTPD)

Runtime: PHP 8.x

Platform: Optimized for AWS EC2 (Ubuntu 22.04 LTS)

📋 Key Features
Bash Strict Mode: Built with set -euo pipefail to ensure the script exits immediately on any error, preventing "zombie" or corrupted deployments.

Automated Dependency Management: Handles all PHP module installations and system package updates programmatically.

Security-First Permissions: Implements strict www-data ownership and industry-standard file permissions (755 for directories, 644 for files).

Dynamic Virtual Hosting: Automatically generates Apache configuration files, enables URL rewriting, and restarts services.

Pre-seeded Content: Automatically generates a default landing page to verify the installation immediately.

⚙️ Configuration
Before running, you can customize the installation variables at the top of the deploy_dokuwiki.sh script:

INSTALL_DIR: The destination path for your wiki files.

APACHE_SITE: The name for your Apache configuration and logs.

📖 How to Use
Clone the repository:

Bash
git clone https://github.com/WayneB1975/aws-dokuwiki-automation.git
Navigate to the directory:

Bash
cd aws-dokuwiki-automation
Make the script executable:

Bash
chmod +x deploy_dokuwiki.sh
Run the script:

Bash
sudo ./deploy_dokuwiki.sh
