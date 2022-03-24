# Raspberry Pi Multi Camera Streaming Setup (Software)

A collection of playbooks/scripts to use Raspberry Pi's to send video into OBS to create rich, 
multi-camera livestreams.

The core tool being used here is [ansible](https://docs.ansible.com/), which enables a single computer to control many other computers (in this case Raspberry Pi's), to install software and run commands.

The _control node_, is the machine sending commands, and the _hosts_ (so Pi's) are the computers under control.

## Getting Started

You'll need to [install ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
On the control node. This can be done with `apt` on Ubuntu with:

```bash
sudo apt-add-repository ppa:ansible/ansible
sudo apt install ansible
```

Dependencies to start streaming etc. will be installed on the hosts using the playbooks at runtime.

Run a playbook on a specific host with:

```bash
ansible-playbook start_streaming.yml -i hosts.yml --limit overhead-camera
```

On all hosts:

```bash
ansible-playbook start_streaming.yml -i hosts.yml
```

## Ansible

This directory contains an ansible playbook and inventory file, as well as supporting
scripts/services to be able to define where cameras are on the network and get them streaming.

### Playbooks

| **Playbook**          | **Description**                                                                                                                                                                                         |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `take_still.yml`      | Stops the stream (if it's running), takes a photo, starts the stream back up (if it was running), and then pushes the file to the host running the playbook. The photo is then deleted from the remote. |
| `start_streaming.yml` | Copies over scripts, and installs dependencies needed to get streaming. Installs the systemd service, and then starts the stream.                                                                       |
| `stop_streaming.yml`  | Stops the livestream if it's installed and running.                                                                                                                                                     |

The inventory file, `hosts.yml`, describes my personal setup to serve as an example.
