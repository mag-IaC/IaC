#cloud-config
package_update: true
packages:
  - nginx
write_files:
  - path: /var/www/html/index.html
    permissions: '0644'
    content: |
      <html>
        <head><title>Terraform Compute Demo</title></head>
        <body>
          <h1>Hello from environment: ${environment}</h1>
          <h3> Made by Magnus Lange </h3>
        </body>
      </html>
runcmd:
  - systemctl enable nginx
  - systemctl start nginx
