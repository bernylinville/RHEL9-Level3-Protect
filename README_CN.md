# RHEL9 Level 3 Protect Ansible Role

**[English Docs](./README.md)**

**RHEL9 Level 3 Protect** Ansible 角色旨在自动化 AlmaLinux 9.4 系统的配置和加固，以符合中国信息安全标准（等保3级）的要求。该角色确保您的系统根据最佳实践进行安全配置，涵盖 SSH 配置、用户管理、防火墙设置等多个方面。

## 功能

- **操作系统验证**：确保角色仅在受支持的操作系统上运行。
- **软件安装**：安装和配置必要的软件包。
- **SSH 加固**：通过自定义设置保护 SSH 配置。
- **用户管理**：管理用户账户并强制执行密码策略。
- **防火墙配置**：设置并配置 firewalld 以及必要的端口。
- **系统优化**：调整系统限制和内核参数以优化性能。
- **日志和审计**：配置 rsyslog 和 auditd 以实现全面的日志记录。
- **清理任务**：删除不必要的文件并清理系统缓存。

## 需求

- **操作系统**：AlmaLinux 9.4
- **Ansible 版本**：2.17.5 或更高
- **依赖项**：确保已安装 `requirements.txt` 中列出的所有依赖项。

## 安装

1. **克隆仓库**
   ```bash
   git clone https://github.com/yourusername/RHEL9-Level3-Protect.git
   cd RHEL9-Level3-Protect
   ```

2. **安装依赖**
   ```bash
   pip install -r requirements.txt
   ```

3. **配置库存**
   更新 `hosts.yml` 文件，添加目标主机：
   ```yaml
   all:
     hosts:
       host1:
         ansible_host: 10.0.66.66
         ansible_user: vagrant
         ansible_password: vagrant
   ```

## 使用方法

使用以下命令运行 playbook：

```bash
ansible-playbook -i hosts.yml site.yml
```


## 变量

通过编辑 `defaults/main.yml` 中的变量来自定义配置：
- **SSH 设置**：自定义 SSH 端口、登录超时等参数。
- **用户凭证**：设置 root、admin 和 dev 用户的密码。
- **防火墙端口**：定义要在防火墙中打开的端口。
- **系统设置**：调整系统限制、时区及其他内核参数。

## 示例 Playbook

```yaml
- name: Apply RHEL9 Level 3 Protect
  hosts: all
  become: true
  roles:
    - role: "{{ playbook_dir }}"
```


## 许可证

本项目采用 [Apache License 2.0](LICENSE) 许可。

## 贡献

欢迎贡献！请提交拉取请求或开启问题以报告任何增强功能或错误。

## 支持

如需支持，请联系 [Berny Linville](mailto:bernylinville@devopsthink.org)。
