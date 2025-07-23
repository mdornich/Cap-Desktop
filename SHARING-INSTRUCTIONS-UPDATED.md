# CAP Local Setup - One-Click Launch

## 🎯 **What This Gives Your Colleague**
- **One-click launch**: Single script starts backend + desktop app
- **No terminal needed**: Double-click to launch everything
- **Custom U-shaped template**: Pre-configured with brand colors
- **Completely local**: No internet or authentication required

## 📋 **Prerequisites** (Your colleague needs)
1. **Docker Desktop** installed and running
2. **CAP Desktop App**: Download "Cap - Development.app" 
3. **Git** (for cloning)

## 🚀 **Super Simple Setup**

### **Step 1: Get the Repository**
Since you're working on the original CapSoftware/Cap repository, your colleague should:

```bash
# Clone the main repository
git clone https://github.com/CapSoftware/Cap.git
cd Cap

# Switch to your feature branch
git checkout feature-analysis-report
```

**OR** (Recommended): Create a fork first:
1. Go to https://github.com/CapSoftware/Cap
2. Click "Fork" button
3. Then your colleague clones: `git clone https://github.com/YOUR-USERNAME/Cap.git`

### **Step 2: One-Click Launch**
```bash
# Make the launcher executable (one time only)
chmod +x launch-cap-with-backend.sh

# Launch everything with one command!
./launch-cap-with-backend.sh
```

That's it! The script will:
- ✅ Check if Docker is running (start it if needed)
- ✅ Start the CAP backend services
- ✅ Wait for services to initialize
- ✅ Launch the CAP Desktop App automatically

## 🎬 **Using CAP**
1. **First time**: Run `./launch-cap-with-backend.sh`
2. **Look for**: "U-Shape Corporate" template in the app
3. **When done**: Run `./stop-local-cap.sh` to stop backend

## 🔧 **Even Easier: Desktop Launcher**
Your colleague can also:
1. Right-click `launch-cap-with-backend.sh` 
2. Select "Open With" → "Terminal"
3. Or create a desktop shortcut to double-click launch

## 🎨 **Template Details**
The "U-Shape Corporate" template includes:
- **Colors**: #0B557A (deep blue) → #A3DDFB (light blue) gradient
- **Layout**: Camera in bottom-left corner
- **Style**: Professional shadows and rounded corners
- **Background**: Diagonal gradient (135° angle)

## 🆘 **If Something Goes Wrong**
```bash
# Stop everything and restart
./stop-local-cap.sh
./launch-cap-with-backend.sh

# Check what's running
docker ps

# View detailed logs
docker logs cap-mysql
docker logs cap-minio
```