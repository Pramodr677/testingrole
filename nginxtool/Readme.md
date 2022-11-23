Nginx Setup
=========

This role is to install Nginx and perform reverse proxy ,load balancing

Requirements
------------
           *  build-essential (Ubuntu)
           * @Development tools" (Redhat)
           * zlib-devel
           * pcre-devel 
           * openssl-devel
           * perl
           * perl-devel
           * perl-ExtUtils-Embed 
           * libxslt
           * libxslt-devel
           * libxml2
           * libxml2-devel
           * gd
           * gd-devel
           * wget

Supported OS
------------
  * Ubuntu
  * RedHat

Role Variables
--------------
|**Variables**| **Default Values**| 
|----------|---------|
| version | "nginx-1.16.0"|
| nginx_error_log| /var/log/nginx/error.log|
| nginx_access_log | /var/log/nginx/access.log| 
| nginx_worker_processes | auto | 
| nginx_worker_connections | 512| 
| nginx_worker_connections | on| 
| nginx_tcp_nopush| on | 
| listen_port| 80| 


Directory Layout
----------------
```
NGINX
.
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── tasks
│   ├── setup-Ubuntu.yml 
│   ├── main.yml
│   └── setup-RedHat.yml 
    └── nginxlog_exporter.yml 
     
├── templates
│   └── index.html.j2(backend server 1 static content)
    └── ndex.httml.j2 (backend server 2 static content)
    └── nginx_conf.j2 (Proxy server main nginx.conf file)
    └── myapp.conf.j2  (Proxy server reverse proxy and upstream setup file)
    └── nginx_conf1.j2 (backend server 1 main config file)
    └── nginx_conf2.j2 (backend server 2 main config file)
    └── service_file.j2 
    └── nginxlog_exporter.service
    └── nginxlog_exporter.yml 
└── vars
    └── main.yml

5 directories, 16 files

```
Inventory
----------
For Nginx set up: An inventory should look like this:-
```ini
[app]                 
node4 xxx.xxx.xxx.xxx   ansible_user=xyz
node3 xxx.xxx.xxx.xxx   ansible_user=xyz 

```
where, The app group contains the details of the nodes who server content as a reverse proxy and load balance.


Example Playbook
----------------
```
- name: INSTALL NGINX & CONFIGURE IT 
   hosts: all
   become: true
   roles:
      - role: '../nginxrole'
```

Author Information
------------------

[Pramod Rajput] 
