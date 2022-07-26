# Add packages to Poetry from requirements.txt
cat requirements.txt | xargs poetry add

# Create video from PNGs
ffmpeg -r 25 -f image2 -s 1024x1024 -start_number 2 -i image0000-step%*.png -vcodec libx264 -crf 25  -pix_fmt yuv420p my_face.mp4

# Restart USB Ports
sudo dpkg-reconfigure xserver-xorg

# Exclude file from Git diff
git diff -- . ':(exclude)package-lock.json'

# Concat Videos
ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4

# Get screen dims
xdpyinfo | grep dimensions

# Fix dodgy package installs
sudo dpkg --configure -a

# Full system update
sudo apt update
sudo apt full-upgrade

# Get status of caps lock
echo -q | grep "Caps Lock" | awk '{print $4}' # off / on

# Get size of something in human readable form
du -hs ./{thing}
