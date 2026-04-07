# --- 1. System Prep ----------------------------------------------------------
echo "[1/7] Updating system packages..."
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
  apache2 \
  php \
  php-xml \
  php-gd \
  php-cli \
  php-curl \
  php-mbstring \
  libapache2-mod-php


# --- 2. Directory Setup ------------------------------------------------------
echo "[2/7] Preparing install directories..."
sudo rm -f /var/www/html/index.html
sudo mkdir -p "$INSTALL_DIR"
sudo mkdir -p "$TEMP_DIR"


# --- 3. Download & Extract ---------------------------------------------------
echo "[3/7] Downloading DokuWiki..."
cd "$TEMP_DIR"
sudo wget -q "$DOKUWIKI_URL"
sudo tar xf dokuwiki-stable.tgz --strip-components=1 -C "$INSTALL_DIR"


# --- 4. Permissions ----------------------------------------------------------
echo "[4/7] Setting file permissions..."
sudo chown -R www-data:www-data "$INSTALL_DIR"
sudo find "$INSTALL_DIR" -type d -exec chmod 755 {} \;
sudo find "$INSTALL_DIR" -type f -exec chmod 644 {} \;


# --- 5. Apache Virtual Host --------------------------------------------------
echo "[5/7] Configuring Apache virtual host..."
sudo tee /etc/apache2/sites-available/${APACHE_SITE}.conf > /dev/null <<EOF
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot ${INSTALL_DIR}

    <Directory ${INSTALL_DIR}>
        AllowOverride All
        Require all granted
        Options +FollowSymLinks
        DirectoryIndex doku.php
    </Directory>

    ErrorLog  \${APACHE_LOG_DIR}/${APACHE_SITE}_error.log
    CustomLog \${APACHE_LOG_DIR}/${APACHE_SITE}_access.log combined
</VirtualHost>
EOF


# --- 6. Default Landing Page -------------------------------------------------
echo "[6/7] Creating default wiki home page..."
sudo mkdir -p "${INSTALL_DIR}/data/pages"
sudo tee "${INSTALL_DIR}/data/pages/home.txt" > /dev/null <<'EOF'
====== My Personal Knowledge Base ======

===== Project Overview =====
This is a custom-deployed DokuWiki instance, optimized for private documentation.

===== Quick Start =====
  * [[projects|Current Projects]] - What I'm working on
  * [[servers|Server Logs]]       - Infrastructure details

===== Tech Stack =====
  * **OS:**         Ubuntu
  * **Web Server:** Apache
  * **Engine:**     PHP
EOF


# --- 7. Enable Site & Restart Apache -----------------------------------------
echo "[7/7] Enabling site and restarting Apache..."
sudo a2dissite 000-default.conf
sudo a2ensite  ${APACHE_SITE}.conf
sudo a2enmod   rewrite
sudo systemctl restart apache2

echo ""
echo "✓ DokuWiki installed successfully at http://localhost/kb"
echo "  Complete setup by visiting the installer in your browser."



