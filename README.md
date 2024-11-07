# RHEL9 Level 3 Protect Ansible Role

**[中文文档](./README_CN.md)**

The **RHEL9 Level 3 Protect** Ansible role is designed to automate the configuration and hardening of AlmaLinux 9.4 systems to comply with the Level 3 requirements of the Chinese Information Security Standard (等保 3 级). This role ensures that your systems are secured according to best practices, covering aspects such as SSH configuration, user management, firewall settings, and more.

## Features

- **OS Validation**: Ensures the role runs only on supported operating systems.
- **Software Installation**: Installs and configures essential packages.
- **SSH Hardening**: Secures SSH configurations with custom settings.
- **User Management**: Manages user accounts and enforces password policies.
- **Firewall Configuration**: Sets up and configures firewalld with necessary ports.
- **System Optimization**: Tweaks system limits and kernel parameters for optimal performance.
- **Logging and Auditing**: Configures rsyslog and auditd for comprehensive logging.
- **Cleanup Tasks**: Removes unnecessary files and cleans system caches.

## Requirements

- **Operating System**: AlmaLinux 9.4
- **Ansible Version**: 2.17.5 or higher
- **Dependencies**: Ensure all dependencies listed in `requirements.txt` are installed.

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/RHEL9-Level3-Protect.git
   cd RHEL9-Level3-Protect
   ```

2. **Install Dependencies**

   ```bash
   pip install -r requirements.txt
   ```

3. **Configure Inventory**
   Update the `hosts.yml` file with your target hosts:
   ```yaml
   all:
     hosts:
       host1:
         ansible_host: 10.0.66.66
         ansible_user: vagrant
         ansible_password: vagrant
   ```

## Usage

Execute the playbook using the following command:

```bash
ansible-playbook -i hosts.yml site.yml
```

## Variables

Customize the configuration by editing the variables in `defaults/main.yml`:

- **SSH Settings**: Customize SSH port, login timeout, and other SSH parameters.
- **User Credentials**: Set passwords for root, admin, and dev users.
- **Firewall Ports**: Define which ports to open in the firewall.
- **System Settings**: Adjust system limits, timezone, and other kernel parameters.

## Example Playbook

```yaml
- name: Apply RHEL9 Level 3 Protect
  hosts: all
  become: true
  roles:
    - role: "{{ playbook_dir }}"
```

## License

This project is licensed under the [Apache License 2.0](LICENSE).

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bugs.

## Support

For support, please contact [Berny Linville](mailto:berny.linville@devopsthink.org).
