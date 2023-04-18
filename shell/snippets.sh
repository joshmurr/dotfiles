# Add packages to Poetry from requirements.txt
cat requirements.txt | xargs poetry add

# Create video from PNGs
ffmpeg -r 25 -f image2 -s 1024x1024 -start_number 2 -i image0000-step%*.png -vcodec libx264 -crf 25 -pix_fmt yuv420p my_face.mp4

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

# Start Gatsby with an exposed server on the network
gatsby develop -H 0.0.0.0
# or
npm run dev -- -H 0.0.0.0

# Run a Conjure REPL
clojure -Sdeps '{:deps {nrepl {:mvn/version "0.7.0"} cider/cider-nrepl {:mvn/version "0.25.0"}}}' -m nrepl.cmdline --middleware '["cider.nrepl/cider-middleware"]'
clj -Sdeps '{:deps {nrepl/nrepl {:mvn/version "0.9.0"} cider/cider-nrepl {:mvn/version "0.28.4"}}}' -m nrepl.cmdline --middleware '["cider.nrepl/cider-middleware"]' --interactive

# Get LOC in Git repo
find ./src/ -type f -name '*.ts' | xargs wc -l

# Unshallow a Git repo - in this case Conjure
cd ~/.local/share/nvim/site/pack/packer/start/conjure/
git fetch --unshallow

# Reset Trackpad
sudo modprobe -r hid_multitouch && sudo modprobe hid_multitouch

# Run Conky
conky -c ~/dotfiles/conky/.conkyrc
