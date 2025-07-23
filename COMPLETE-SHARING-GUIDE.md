# CAP Local Setup - Complete Guide for Sharing

## 🎯 **What Your Colleague Gets**
- **Local CAP Backend**: No internet required, no authentication
- **Custom U-shaped Template**: Pre-configured with your brand colors (#0B557A → #A3DDFB)
- **One-Click Launch Script**: Starts everything with a single command
- **Complete Privacy**: All recordings stored locally

---

## 📋 **Prerequisites (One-Time Setup)**

### 1. **Install Docker Desktop**
- Download from: https://www.docker.com/products/docker-desktop/
- Install and start Docker Desktop

### 2. **Download CAP Desktop App** 
- Download "CAP" from: https://cap.so/download
- Install the app in `/Applications` folder
- **Important**: This is separate from the git repository!

### 3. **Install Git** (if needed)
- Most Macs already have git installed

---

## 🚀 **Setup Steps**

### **Step 1: Get the Code**
```bash
# Clone the repository
git clone https://github.com/CapSoftware/Cap.git
cd Cap

# Switch to your branch with the custom template
git checkout feature-analysis-report

# Navigate to the cap-desktop directory
cd cap-desktop
```

### **Step 2: Make Launch Script Executable** (One-Time)
```bash
chmod +x launch-cap-with-backend.sh
```

---

## 🎬 **Using CAP (Every Time)**

### **The Launch Process** (Required Each Time)
```bash
# 1. Open Terminal and navigate to the project
cd path/to/Cap/cap-desktop

# 2. Start backend + launch app (ONE COMMAND!)
./launch-cap-with-backend.sh
```

**What this script does:**
- ✅ Checks if Docker is running (starts it if needed)
- ✅ Starts CAP backend services (MySQL + MinIO)
- ✅ Waits for services to be ready
- ✅ Automatically opens the CAP Desktop App

### **Finding Your Template**
1. Look for **"U-Shape Corporate"** in the CAP app's template selection
2. It includes your brand gradient and camera positioning
3. Ready to record immediately!

### **When Finished Recording**
```bash
# Stop the backend services
./stop-local-cap.sh
```

---

## ❓ **Important Clarifications**

### **Q: Does the CAP app auto-start Docker when I click it?**
**A: NO** - You must run the launch script first, then the app will connect to the local backend.

### **Q: Is this a one-time setup?**
**A: Setup is one-time, but launching requires the script every session.**

**Workflow:**
1. **Setup**: Clone repo, install prerequisites (ONE TIME)
2. **Every Use**: Run launch script → Use CAP app → Stop script when done

### **Q: Can I just double-click the app in Applications?**
**A: Not directly** - The app needs the local backend running first. Always use the launch script.

---

## 🔧 **Alternative: Desktop Launcher**
For even easier access, your colleague can:
1. Right-click `launch-cap-with-backend.sh` in Finder
2. Select "Open With" → "Terminal"
3. Or create a desktop alias to the script

---

## 🆘 **Troubleshooting**

### **Backend Won't Start**
```bash
# Check Docker is running
docker ps

# Restart everything
./stop-local-cap.sh
./launch-cap-with-backend.sh
```

### **Template Not Showing**
- Make sure you're on the `feature-analysis-report` branch
- Restart the CAP desktop app
- Check that the backend script ran successfully

### **Permission Errors**
```bash
# If script won't run
chmod +x launch-cap-with-backend.sh

# If Docker issues
sudo docker ps
```

---

## 📁 **Repository Structure**
```
Cap/                          # Main repository
├── cap-desktop/              # ← Navigate here
│   ├── launch-cap-with-backend.sh  # ← Your launch script
│   ├── stop-local-cap.sh          # ← Stop script
│   └── .env                       # ← Pre-configured for local backend
└── [other directories...]
```

**Key Point**: The git repository (`Cap`) contains the configuration files and launch scripts. The desktop app is downloaded separately and connects to this local backend.