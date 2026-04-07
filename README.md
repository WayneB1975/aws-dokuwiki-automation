# aws-dokuwiki-automation
Bash script to automate the deployment and configuration for Doku Wiki on an Ubuntu/Apache stack.

# DokuWiki Automated Deployment Script

## 🚀 Project Overview
This project automates the installation and configuration of a **DokuWiki** instance on an Ubuntu-based Linux server using **Apache** and **PHP**. 

As part of my Cloud Engineering path, I developed this script to eliminate manual configuration errors and ensure a consistent, repeatable deployment process for internal documentation hubs.

## 🛠 Tech Stack
* **Language:** Bash Scripting
* **Web Server:** Apache (HTTPD)
* **Runtime:** PHP 8.x
* **Platform:** Designed for AWS EC2 (Ubuntu 22.04 LTS)

## 📋 Key Features
* **Automated Dependency Management:** Installs all necessary PHP modules and system updates.
* **Security-First Permissions:** Implements `www-data` ownership and restricted file permissions (755/644).
* **Virtual Host Configuration:** Automatically generates Apache `.conf` files and enables URL rewriting.
* **Pre-seeded Content:** Generates a default "Home" page upon first launch.

## 📖 How to Use
1. Clone the repository: `git clone https://github.com/WayneB1975/aws-dokuwiki-automation.git`
2. Make the script executable: `chmod +x deploy_dokuwiki.sh`
3. Run the script: `sudo ./deploy_dokuwiki.sh`
