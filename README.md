# Raspberry Pi Multi Camera Streaming Setup (Software)

A collection of playbooks/scripts to use Raspberry Pi's to send video into OBS to create rich, 
multi-camera livestreams.

# Ansible

This directory contains an ansible playbook and inventory file, as well as supporting
scripts/services to be able to define where cameras are on the network and get them streaming.

## Playbooks

| **Playbook**          | **Description**                                                                                                                                                                                         |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `take_still.yml`      | Stops the stream (if it's running), takes a photo, starts the stream back up (if it was running), and then pushes the file to the host running the playbook. The photo is then deleted from the remote. |
| `start_streaming.yml` | Copies over scripts, and installs dependencies needed to get streaming. Installs the systemd service, and then starts the stream.                                                                       |
| `stop_streaming.yml`  | Stops the livestream if it's installed and running.                                                                                                                                                     |
