# Docker Cleanup Script

This script stops, removes all Docker containers, deletes all Docker images, and optionally removes all Docker volumes **only after user confirmation**.

## ⚠ Warning
This script will delete **all** Docker containers, images, and volumes on your system.  
Make sure you really want to do this before proceeding.

---

## Features
- Interactive confirmation before each action.
- Stops all running containers.
- Removes all containers (running or stopped).
- Removes all Docker images.
- Removes all Docker volumes.

---

## Usage

1. Save the script as `cleanup_docker.sh`.
2. Make it executable:
   ```bash
   chmod +x cleanup_docker.sh
   ```
3. Run the script:
   ```bash
   ./cleanup_docker.sh
   ```
4. Follow the on-screen prompts:
   - Type `y` or `Y` to confirm an action.
   - Press **Enter** or type `n` to skip.

---

## Commands Explained
- **`docker ps -q`** → Lists container IDs of running containers.
- **`docker stop $(docker ps -q)`** → Stops all running containers.
- **`docker ps -aq`** → Lists all container IDs.
- **`docker rm $(docker ps -aq)`** → Removes all containers.
- **`docker images -q`** → Lists all image IDs.
- **`docker rmi $(docker images -q) -f`** → Removes all images forcefully.
- **`docker volume ls -q`** → Lists all volume names.
- **`docker volume rm $(docker volume ls -q)`** → Removes all volumes.

---

## Example Output
```text
=== Docker Cleanup Script ===
Do you really want to STOP all running containers? (y/N): y
Stopping all running containers...
Do you really want to REMOVE all containers? (y/N): y
Removing all containers...
Do you really want to REMOVE all Docker images? (y/N): n
Skipping image removal.
Do you really want to REMOVE all Docker volumes? (y/N): y
Removing all volumes...
=== Cleanup completed ===
```
