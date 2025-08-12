# Docker Cleanup Script

This script stops, removes all Docker containers, and deletes all Docker images **only after user confirmation**.

## ⚠ Warning
This script will delete **all** Docker containers and images on your system.  
Make sure you really want to do this before proceeding.

---

## Features
- Interactive confirmation before each action.
- Stops all running containers.
- Removes all containers (running or stopped).
- Removes all Docker images.

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
- **`docker ps -q`** → Lists only the container IDs of running containers.
- **`docker stop $(docker ps -q)`** → Stops all running containers.
- **`docker ps -aq`** → Lists all container IDs (running or stopped).
- **`docker rm $(docker ps -aq)`** → Removes all containers.
- **`docker images -q`** → Lists all image IDs.
- **`docker rmi $(docker images -q) -f`** → Removes all images forcefully.

---

## Example Output
```text
=== Docker Cleanup Script ===
Do you really want to STOP all running containers? (y/N): y
Stopping all running containers...
Do you really want to REMOVE all containers? (y/N): n
Skipping container removal.
Do you really want to REMOVE all Docker images? (y/N): y
Removing all images...
=== Cleanup completed ===
```
